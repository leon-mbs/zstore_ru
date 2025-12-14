<?php

namespace App\Entity;

/**
 * Класс-сущность  оплата
 *
 * @table=iostate
 * @keyfield=id
 * @view=iostate_view
 */
class IOState extends \ZCL\DB\Entity
{
    //доход платежи
    public const TYPE_BASE_INCOME  = 1;     //доходы реализации товаров  услцн
    public const TYPE_OTHER_INCOME = 2;     //прочие доходы
    public const TYPE_FIN          = 3;     //доходы от  фин.  деятельности
 //   public const TYPE_CANCEL_CUST  = 5;     //отмена  платежа  покупки
 //   public const TYPE_INEQ         = 6;     //ввод в  экплуатацию ОС
  //  public const TYPE_INVEQ        = 7;     //ремонт и восстановдение ОС

    //внебалансовые доходы (для  статистики)
    public const TYPE_OVER      = 30;     //излишки при инвентаризации
 
    //расход платежи
    public const TYPE_BASE_OUTCOME     = 50;    // закупка ТМЦ  услуг
    public const TYPE_COMMON_OUTCOME   = 51;    //общепроизводственные  расходы
    public const TYPE_ADMIN_OUTCOME    = 52;    //административные  расходы
    public const TYPE_SALE_OUTCOME     = 53;    //расходы на сбыт
    public const TYPE_SALARY_OUTCOME   = 54;    //выплата зарплат
    public const TYPE_TAX_OUTCOME      = 55;    //уплата прочих налогов  и сборов
    public const TYPE_TAX_NDS          = 70;    //уплата  НДС
    public const TYPE_TAX_CARE         = 71;    //уплата  по страхованию
    public const TYPE_BILL_RENT        = 56;    //расходы на  аренду
    public const TYPE_OTHER_OUTCOME    = 57;   //прочие расходы
    public const TYPE_DIVIDEND_OUTCOME = 58;   //распределение прибыли
    public const TYPE_INV              = 59;   //Инвестиции
    public const TYPE_BANK             = 60;   //Банковское  обслуживание
  //  public const TYPE_CANCEL           = 61;    //отмена  платежа  продажи
    public const TYPE_NAKL             = 62;    //накладные  расходы
    public const TYPE_ADS              = 63;    //   расходы на  маркетинг
    public const TYPE_BILL_OUTCOME     = 64;    //расходы на  комуналку
    public const TYPE_OUTSERVICE       = 65;    //расходы на услуги
  //  public const TYPE_AMOR             = 67;    // амортизация ОС
     public const TYPE_PROD             = 68;    // прямые производственные  затраты
  //   public const TYPE_ADVANCEREP       = 69;    // Подотчет сотрудниу

    //внебалансовые расходы (для  статиcтики)   
    public const TYPE_LOST             = 80;     //потери при инвентаризации
    public const TYPE_TRASH            = 81;     //отходы производства
    public const TYPE_OUTEQ            = 82;    // списание ОС
  


    protected function init() {
        $this->id = 0;
        $this->iotype = 0;

    }

    /**
    * Добавление  записи  о расходах-доходах
    * 
    * @param mixed $document_id
    * @param mixed $amount
    * @param mixed $type
    * @param mixed $storno   для возвратов
    * @return mixed
    */
    public static function addIOState($document_id, $amount, $type,$storno=false) {
        if (0 == doubleval($amount) || 0 == intval($document_id) || 0 == intval($type)) {
            return;
        }

        $amount = abs($amount) ;
        if(intval($type) >= 50) { //расходы
            $amount = 0 - $amount;
        }

        if($storno) {  
            $amount = 0 - $amount;
        }


        $io = new  IOState();
        $io->document_id = $document_id;
        $io->amount = $amount;
        $io->iotype = $type;
        $io->save();
    }


    protected function afterLoad() {
        $this->document_date = strtotime($this->document_date);

        parent::afterLoad();
    }

    /**
     * типы  доходов  и расходов
     *
     * @param mixed $type 1=    доход (для списков),2-   расход (для списков),   0 - все 
     */
    public static function getTypeList($type = 0) {
        $list = array();
        if ($type == 1 ||   $type == 0  ) {
            $list[self::TYPE_BASE_INCOME] = "Доходы реализации";

            $list[self::TYPE_FIN] = "Доходы о  финансовых операций";
          //  $list[self::TYPE_CANCEL_CUST] = "Скасування платежу закупівлі";
            $list[self::TYPE_OTHER_INCOME] = "Прочие  доходы";
         //  $list[self::TYPE_INEQ] = "Інші доходи";
        }

        if ($type == 2 ||   $type == 0  ) {
            $list[self::TYPE_BASE_OUTCOME] = "Расходы на закупку";
            $list[self::TYPE_COMMON_OUTCOME] = "Общепроизводственные  расходы";
            $list[self::TYPE_PROD] = "Расходы на производство";
            $list[self::TYPE_ADMIN_OUTCOME] = "Административные расходы";
            $list[self::TYPE_SALE_OUTCOME] = "Расходы на сбыт";
            $list[self::TYPE_SALARY_OUTCOME] = "Расходы на зарплату";
            $list[self::TYPE_TAX_NDS] =  "Расчеты по НДС";
            $list[self::TYPE_TAX_CARE] =  "Розрахунки по  соцстрвху";
            $list[self::TYPE_TAX_OUTCOME] =  "прочие налоги и сборы";
            $list[self::TYPE_BILL_OUTCOME] = "Расходы на комуналку";
            $list[self::TYPE_BILL_RENT] = "Расходы на аренду";
            $list[self::TYPE_DIVIDEND_OUTCOME] = "Распределение  прибыли";
            $list[self::TYPE_INV] = "Инвестиции";
            $list[self::TYPE_BANK] = "Услуги банка";
         //   $list[self::TYPE_CANCEL] =  "Скасування платежу продажу";
            $list[self::TYPE_NAKL] =  "Накладные расходы";
            $list[self::TYPE_ADS] =  "Расходы на маркетинг и  рекламу";
            $list[self::TYPE_OTHER_OUTCOME] = "Прочие расходы";
            $list[self::TYPE_OUTSERVICE] = "Расходы на услуги";
     //       $list[self::TYPE_ADVANCEREP] = "Підзвіт співробітнику";
        }

  
 
 
        if (  $type == 0) {
         //   $list[self::TYPE_INEQ] = "Ввод ОЗ в  експлуатацію ";
       //     $list[self::TYPE_INVEQ] = "Ремонт та відновлення ОЗ";
            $list[self::TYPE_OUTEQ] = "Списание ОС";
        //    $list[self::TYPE_AMOR] = "Амортизація ОЗ";
            $list[self::TYPE_LOST] = "Потери при инвентаризации";
            $list[self::TYPE_TRASH] = "Отходы производства";
            $list[self::TYPE_OVER] = "Излишки при инвентаризации";
   
        }

        return $list;
    }
    
    /**
    * Для  начисления  зарплаты
    * 
    */
    public static function getTypeListSal( ) {
       $list = array();
       $list[self::TYPE_PROD] = "Расходы на производство";
       $list[self::TYPE_COMMON_OUTCOME] = "Общепроизводственные  расходы";
       $list[self::TYPE_ADMIN_OUTCOME] = "Административные расходы";
       $list[self::TYPE_SALE_OUTCOME] = "Расходы на сбыт";
       $list[self::TYPE_OTHER_OUTCOME] = "Прочие расходы";
  
       return $list;
    }

 
    /**
    * Для  авансовго отчета
    * 
    */
    public static function getTypeListAdv( ) {
       $list = array();
       $list[self::TYPE_COMMON_OUTCOME] = "Общепроизводственные  расходы";
       $list[self::TYPE_ADMIN_OUTCOME] = "Административные расходы";
       $list[self::TYPE_SALE_OUTCOME] = "Расходы на сбыт";
       $list[self::TYPE_OTHER_OUTCOME] = "Прочие расходы";
  
       return $list;
    }

    /**
    * Для  приходного кассового ордера
    * 
    */
    public static function getTypeListInM( ) {
       $list = array();

       $list[self::TYPE_FIN] = "Доходы от финансовых операций";
       $list[self::TYPE_OTHER_INCOME] = "Прочие доходы";
     
       return $list;
    }
    /**
    * Для  расходного  кассового ордера
    * 
    */
    public static function getTypeListOutM( ) {
        $list = array();

        $list[self::TYPE_COMMON_OUTCOME] = "Общепроизводственные  расходы";
        $list[self::TYPE_ADMIN_OUTCOME] = "Административные расходы";
        $list[self::TYPE_SALE_OUTCOME] = "Расходы на сбыт";
        $list[self::TYPE_TAX_NDS] =  "Расчеты по НДС";
        $list[self::TYPE_TAX_CARE] =  "Расчеты по  соцстраху";
        $list[self::TYPE_TAX_OUTCOME] =  "прочие налоги и сборы";
        $list[self::TYPE_BILL_OUTCOME] = "Расходы на комуналку";
        $list[self::TYPE_BILL_RENT] = "Расходы на аренду";
        $list[self::TYPE_DIVIDEND_OUTCOME] = "Распределение  прибыли";
        $list[self::TYPE_INV] = "Инвестиции";
        $list[self::TYPE_NAKL] =  "Накладные расходы";
        $list[self::TYPE_ADS] =  "Расходы на маркетинг и рекламу";
        $list[self::TYPE_BANK] = "Услуги банка";
        $list[self::TYPE_SALARY_OUTCOME] = "Выплата зарплаты";
        $list[self::TYPE_OTHER_OUTCOME] = "Прочие  расходы";
   
       return $list;
    }
    
    
}
