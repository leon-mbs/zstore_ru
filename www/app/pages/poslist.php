<?php

namespace App\Pages;

use App\Entity\Pos;
use App\Helper as H;
use App\System;
use Zippy\Html\DataList\DataView;
use Zippy\Html\Form\Button;
use Zippy\Html\Form\DropDownChoice;
use Zippy\Html\Form\Form;
use Zippy\Html\Form\SubmitButton;
use Zippy\Html\Form\TextArea;
use Zippy\Html\Form\TextInput;
use Zippy\Html\Form\CheckBox;
use Zippy\Html\Label;
use Zippy\Html\Link\ClickLink;
use Zippy\Html\Panel;
use Zippy\Html\Form\File;

//POS терминалы
class PosList extends \App\Pages\Base
{
    private $_pos;
    private $_blist;

    public function __construct() {
        parent::__construct();
        if (System::getUser()->rolename != 'admins') {
            System::setErrorMsg("До сторінки має доступ тільки користувачі з роллю admins  ");
            \App\Application::RedirectError();
            return  ;
        }
        $this->_blist = \App\Entity\Branch::getList(\App\System::getUser()->user_id);

        $this->add(new Panel('postable'))->setVisible(true);
        $this->postable->add(new DataView('poslist', new \ZCL\DB\EntityDataSource('\App\Entity\Pos', '', ' pos_name asc'), $this, 'poslistOnRow'))->Reload();
        $this->postable->add(new ClickLink('addnew'))->onClick($this, 'addOnClick');

        $this->add(new Form('posdetail'))->setVisible(false);
        $this->posdetail->add(new DropDownChoice('editbranch', $this->_blist, 0));
       
        $this->posdetail->add(new TextInput('editpos_name'));


        
        $this->posdetail->add(new TextInput('editaddress'));
     
        $this->posdetail->add(new TextInput('editpointname'));
 
     

        $this->posdetail->add(new TextArea('editcomment'));

        $this->posdetail->add(new CheckBox('editusefreg'));
        $this->posdetail->add(new TextArea('editscriptfreg'));
             
        $this->posdetail->add(new SubmitButton('save'))->onClick($this, 'saveOnClick');
        $this->posdetail->add(new Button('cancel'))->onClick($this, 'cancelOnClick');
        
  
        
        $modules = System::getOptions('modules');

        $this->_tvars["loadkey"] = ($modules['ppo'] == 1 || $modules['vdoc'] == 1 ) ;
        
    }

    public function poslistOnRow($row) {
        $item = $row->getDataItem();

        $row->add(new Label('pos_id', $item->pos_id));
        $row->add(new Label('pos_name', $item->pos_name));
        $row->add(new Label('branch_name', $this->_blist[$item->branch_id]??''));
        $row->add(new Label('comment', $item->comment));
        $row->add(new ClickLink('edit'))->onClick($this, 'editOnClick');
        $row->add(new ClickLink('delete'))->onClick($this, 'deleteOnClick');
      
    }

    public function deleteOnClick($sender) {
        if (false == \App\ACL::checkEditRef('PosList')) {
            return;
        }
        $pos = $sender->owner->getDataItem();

        $del = Pos::delete($pos->pos_id);
        if (strlen($del) > 0) {
            $this->setError($del);
            return;
        }
        $this->postable->poslist->Reload();
    }

    public function editOnClick($sender) {
        $this->_pos = $sender->owner->getDataItem();
        $this->postable->setVisible(false);
        $this->posdetail->setVisible(true);
        $this->posdetail->editpos_name->setText($this->_pos->pos_name);
        $this->posdetail->editbranch->setValue($this->_pos->branch_id);

        $this->posdetail->editaddress->setText($this->_pos->address);

        $this->posdetail->editpointname->setText($this->_pos->pointname);
        
          $this->posdetail->editusefreg->setChecked($this->_pos->usefreg);
        $this->posdetail->editscriptfreg->setText($this->_pos->scriptfreg);
    
        $this->posdetail->editcomment->setText($this->_pos->comment);
    }

    public function addOnClick($sender) {
        $this->postable->setVisible(false);
        $this->posdetail->setVisible(true);
        // Очищаем  форму
        $this->posdetail->clean();
        $b = \App\System::getBranch();
        $this->posdetail->editbranch->setValue($b > 0 ? $b : 0);
         
        $this->_pos = new Pos();
    }

    public function saveOnClick($sender) {
        if (false == \App\ACL::checkEditRef('PosList')) {
            return;
        }


        $this->_pos->pos_name = $this->posdetail->editpos_name->getText();

        $this->_pos->branch_id = $this->posdetail->editbranch->getValue();

        $this->_pos->address = $this->posdetail->editaddress->getText();
       
        $this->_pos->pointname = $this->posdetail->editpointname->getText();
     
        
        $this->_pos->usefreg = $this->posdetail->editusefreg->isChecked() ? 1 : 0;
        $this->_pos->scriptfreg = $this->posdetail->editscriptfreg->getText();
  
        if ($this->_pos->pos_name == '') {
            $this->setError("Не задано  название");
            return;
        }
     
        if ($this->_tvars['usebranch'] == true && $this->_pos->branch_id == 0) {

            $this->setError("Не выбран  филиал");
            return;
        }
        $fn = intval($this->_pos->fiscdocnumber);

        if(($fn >0) == false) {
            $this->_pos->fiscdocnumber = 1;
        }

        $this->_pos->comment = $this->posdetail->editcomment->getText();

        $this->_pos->save();
        $this->posdetail->setVisible(false);
        $this->postable->setVisible(true);
        $this->postable->poslist->Reload();
    }

    public function cancelOnClick($sender) {
        $this->postable->setVisible(true);
        $this->posdetail->setVisible(false);
       
    }

    //PPO
    public function ppoOnClick($sender) {

        $this->_pos = $sender->owner->getDataItem();

        $this->postable->setVisible(false);
       

        
    }
    public function delOnClick($sender) {

        $this->_pos->ppoowner =  ''  ;
        $this->_pos->ppocert = ''  ;
        $this->_pos->ppokey =  ''  ;
        $this->_pos->ppokeyid =  ''  ;
        $this->_pos->save();
        $this->postable->setVisible(true);
        $this->posdetail->setVisible(false);

        $this->postable->poslist->Reload();

    }

 
     
}
