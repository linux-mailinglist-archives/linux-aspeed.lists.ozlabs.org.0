Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F44F96F477
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTV0Hs2z3cNP
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725588265;
	cv=none; b=fBzBU60ZTZlSxAhUlqXOscddSuQlekxJMyLdaga/lbch9/T1hTbvEKVkQoU9sT86EBDONLcHQ2wIH1qxvyoYl45QpwaSGb/FyO+x+IDmkhz7LU9wrttePdQufEnKcSMlsi1xJyzZvFLqHhBiGXkfte0b1nRjjNUUJYkP53z+EbjCi6tWq9QvOM2YKJc5N/HfKNDFXRC2htbr20dYLyWKtqNe/rHBgdsOL/Z4gGyPi7ooExF4yWRMaD+zI4/H+460vJJVm0LlxGzFPcuM1nLKquk7pu1br759LPnTsZwYnTjYBUMBh5z8AUF/rlUt348O4mETl251jxxTeFbBawD7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725588265; c=relaxed/relaxed;
	bh=g5zt5iENZxdCcvCMU77wwpZqy42OOFUPHwDaeqbU+A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=acjfMVG7SP9f2BzEpt31VO9skaPc32jWO0+WA9Ap420ZPLuk1RniPSO3qqxKZ9gz7PlUqEGDCWPTZWpBIUOkXt0VKsr+1j11DnD1bmEB4tdeUXyNT65eJosOV8VXlO6MsPKHmTCdWhO+FK8x4gc65tADXqJcvNcTAGOLoWcNlWcgprG5grX4tE48OPSSI8ltzJQmKaHOlzqzhxOKtxQ/EdaKxFE1Ig8TG7NXPXLmHnsh7s50if7uOX9E0t+zKKdjtiIyW3HqBKHSqK0rrAnDlEpb3u61t1B1jNyiqko7KJ5qlztEur+MGLrDM8ztCbIZTTCzKosZUipWOgq3to8uOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=liaochen4@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=liaochen4@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0KKg5yBcz2xnc
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 12:04:19 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0KK13pZsz1j8D6;
	Fri,  6 Sep 2024 10:03:49 +0800 (CST)
Received: from kwepemj200011.china.huawei.com (unknown [7.202.194.23])
	by mail.maildlp.com (Postfix) with ESMTPS id C346E1A0170;
	Fri,  6 Sep 2024 10:04:11 +0800 (CST)
Received: from [10.67.108.52] (10.67.108.52) by kwepemj200011.china.huawei.com
 (7.202.194.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 10:04:11 +0800
Message-ID: <e043ff91-773c-4f30-a709-5aa5f2215755@huawei.com>
Date: Fri, 6 Sep 2024 10:04:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] serial: 8250_aspeed_vuart: Enable module
 autoloading
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20240903131503.961178-1-liaochen4@huawei.com>
 <4nyenalsjnerwjwcuk5zwm52rptnc5jhjhz3yhsmo7qt3gffhs@qadnsjic7p24>
From: "liaochen (A)" <liaochen4@huawei.com>
In-Reply-To: <4nyenalsjnerwjwcuk5zwm52rptnc5jhjhz3yhsmo7qt3gffhs@qadnsjic7p24>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.52]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemj200011.china.huawei.com (7.202.194.23)
X-Mailman-Approved-At: Fri, 06 Sep 2024 22:42:03 +1000
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
Cc: andriy.shevchenko@linux.intel.com, andi.shyti@linux.intel.com, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, florian.fainelli@broadcom.com, tglx@linutronix.de, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2024/9/3 23:49, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Sep 03, 2024 at 01:15:03PM +0000, Liao Chen wrote:
>> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
>> on the alias from of_device_id table.
>>
>> Signed-off-by: Liao Chen <liaochen4@huawei.com>
>> ---
>>   drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> index 53d8eee9b1c8..25c201cfb91e 100644
>> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> @@ -561,6 +561,7 @@ static const struct of_device_id aspeed_vuart_table[] = {
>>   	{ .compatible = "aspeed,ast2500-vuart" },
>>   	{ },
>>   };
>> +MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
> 
> I wonder if you found this entry missing by code review, or if you have
> a machine with that UART and so you actually benefit.

I found it from code review. Since this device could be compiled as a 
module, I think it is better to add this entry.

Thanks,
Chen

> 
> Otherwise looks right to me.
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> Best regards
> Uwe

