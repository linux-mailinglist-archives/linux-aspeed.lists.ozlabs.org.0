Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D73F5923
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 09:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv1H14gH6z2yLk
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 17:40:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv1Gs4JmCz2y8S
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 17:40:01 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gv1GJ17D1z89RY;
 Tue, 24 Aug 2021 15:39:36 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 15:39:48 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 15:39:48 +0800
Subject: Re: [PATCH -next] soc: aspeed-lpc-ctrl: Fix missing
 clk_disable_unprepare() on error in aspeed_lpc_ctrl_probe()
To: Joel Stanley <joel@jms.id.au>
References: <20210823130043.1087204-1-yangyingliang@huawei.com>
 <CACPK8XeUJV2cCaCu+xnX-pGkHVxV9vp3LPj8dJbJbi8SC4Bazw@mail.gmail.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <7ee18b90-f877-15cd-e8aa-c8024847f924@huawei.com>
Date: Tue, 24 Aug 2021 15:39:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeUJV2cCaCu+xnX-pGkHVxV9vp3LPj8dJbJbi8SC4Bazw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On 2021/8/24 12:52, Joel Stanley wrote:
> On Mon, 23 Aug 2021 at 12:55, Yang Yingliang <yangyingliang@huawei.com> wrote:
>> Fix the missing clk_disable_unprepare() before return
>> from aspeed_lpc_ctrl_probe() in the error handling case.
>>
>> Fixes: 2f9b25fa6682 ("soc: aspeed: Re-enable FWH2AHB on AST2600")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/soc/aspeed/aspeed-lpc-ctrl.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>> index 6893c5ec3259..f4c989584d6b 100644
>> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>> @@ -312,7 +312,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>>                  lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
>>                  if (IS_ERR(lpc_ctrl->scu)) {
>>                          dev_err(dev, "couldn't find scu\n");
>> -                       return PTR_ERR(lpc_ctrl->scu);
>> +                       rc = PTR_ERR(lpc_ctrl->scu);
>> +                       goto err;
> Thanks for the patch. Alternatively, we could move this code above the
> devm_clk_get/clk_prepare_enable. I would prefer that option, if you
> want to send a v2.
I can send a v2.

Thanks,
Yang
>
> Cheers,
>
> Joel
> .
