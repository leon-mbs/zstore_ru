<?php

namespace App\Entity;

/**
 * Клас-сущность  терминал
 *
 * @table=poslist
 * @keyfield=pos_id
 */
class Pos extends \ZCL\DB\Entity
{
    protected function init() {
        $this->pos_id = 0;
        $this->fiscalnumber = 0;
    }

    protected function beforeSave() {
        parent::beforeSave();
        //упаковываем  данные в detail
        $this->details = "<details>";

        $this->details .= "<comment><![CDATA[{$this->comment}]]></comment>";
        $this->details .= "<address><![CDATA[{$this->address}]]></address>";
        $this->details .= "<pointname><![CDATA[{$this->pointname}]]></pointname>";
     
     
        $this->details .= "<usefreg>{$this->usefreg}</usefreg>";
        $this->details .= "<scriptfreg>".base64_encode($this->scriptfreg) ."</scriptfreg>";
        
        $this->details .= "</details>";

        return true;
    }

    protected function afterLoad() {
        //распаковываем  данные из detail
        $xml = simplexml_load_string($this->details);

        $this->comment = (string)($xml->comment[0]);
        $this->address = (string)($xml->address[0]);
        $this->pointname = (string)($xml->pointname[0]);
      
    
        $this->testing = (int)($xml->testing[0]);
        $this->usefisc = (int)($xml->usefisc[0]);
        if (strlen(''.$this->fiscdocnumber ) == 0) {
            $this->fiscdocnumber = 1;
        }
        
        $this->usefreg = (int)($xml->usefreg[0]);
        $this->scriptfreg =    base64_decode( ( (string)($xml->scriptfreg[0])  )  ?? '') ;
   
        
        parent::afterLoad();
    }

    public static function getConstraint() {
        return \App\ACL::getBranchConstraint();
    }
    protected function beforeDelete() {

        $cnt= \App\Entity\Doc\Document::findCnt("content like '%<pos>{$this->pos_id}</pos>%'") ;


        if($cnt >0) {
            return "Термiнал вже використаний в чеках";
        }
     

        return "";
    }



}
