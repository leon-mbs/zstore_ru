<?php

namespace App\Entity;

/**
 * сущность для хранения движения по  ОС
 *
 * @view=eqentry_view
 * @table=eqentry
 * @keyfield=id
 */
class EqEntry extends \ZCL\DB\Entity
{  
    public const OP_INCOME = 1;
    public const OP_OUTCOME = 2;
    public const OP_AMOR = 3;
    public const OP_REPAIR = 4;
    public const OP_MOVE = 5;
    public const OP_BUY = 6;
    public const OP_PROD = 7;
    public const OP_STORE = 8;
    public const OP_SELL = 9;
    public const OP_TOSTORE = 10;
    public const OP_LOST = 11;

    public function __construct(   ) {
        parent::__construct();
        
    }

    protected function init() {
        $this->amount;
    }

    protected function afterLoad() {
        $this->document_date = strtotime($this->document_date);
    }

    public static function getOpList(){
        
        $list=[];
        $list[self::OP_INCOME] = 'Ввод в эксплуатацию' ;
        $list[self::OP_OUTCOME] = 'Вывод с  эксплуатации' ;
        $list[self::OP_AMOR] = 'Начисление амортизации' ;
        $list[self::OP_REPAIR] = 'Ремонт и восстановление' ;
        $list[self::OP_MOVE] = 'Перемещение  между участками ' ;
        $list[self::OP_BUY] = 'Закупка' ;
        $list[self::OP_PROD] = 'Оприходование  с  производства' ;
        $list[self::OP_STORE] = 'Оприходование со  склада' ;
        $list[self::OP_SELL] = 'Продажа' ;
        $list[self::OP_TOSTORE] = 'Оприходование на склад' ;
        $list[self::OP_LOST] = 'Списание' ;
        
        return $list ;
   }   
}
