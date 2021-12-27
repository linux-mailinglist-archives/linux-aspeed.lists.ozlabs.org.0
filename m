Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A71E4488E65
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 02:55:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH304RfDz2xX8
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 12:55:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.127; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMqjv1scZz2xCp
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Dec 2021 18:56:16 +1100 (AEDT)
Received: from [192.168.1.18] ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id 1kkIn3FR8onYg1kkInbzlb; Mon, 27 Dec 2021 08:48:43 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 27 Dec 2021 08:48:43 +0100
X-ME-IP: 86.243.171.122
Message-ID: <64cfa75c-61e3-a834-db20-67cee3611d04@wanadoo.fr>
Date: Mon, 27 Dec 2021 08:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] fsi: Aspeed: Fix a potential double free
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <2cafa0607ca171ebd00ac6c7e073b46808e24f00.1640537669.git.christophe.jaillet@wanadoo.fr>
 <YcldM9sgYdjMYMtH@kroah.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YcldM9sgYdjMYMtH@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:51:28 +1100
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
Cc: kernel-janitors@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 alistair@popple.id.au, linux-kernel@vger.kernel.org, jk@ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le 27/12/2021 à 07:29, Greg KH a écrit :
> On Sun, Dec 26, 2021 at 05:56:02PM +0100, Christophe JAILLET wrote:
>> 'aspeed' is a devm_alloc'ed, so there is no need to free it explicitly or
>> there will be a double free().
> 
> A struct device can never be devm_alloced for obvious reasons.  Perhaps
> that is the real problem here?

Thanks for the feed-back.

This goes beyond my knowledge of how this should work.
As I can not test myself, I won't be of any help.
I'll let you or anyone else check if something needs to be fixed, and 
how to fix it properly.

Just take my patch as a "Hey! Looks strange to have a kfree() in a 
driver that only call devm_kzalloc() to allocate memory. S.o. should 
give a deeper look at it". :)

CJ

> 
>> Remove the 'release' function that is wrong and unneeded.
>>
>> Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This patch is completely theoretical. It looks good to me, but there is a
>> little too much indirections for me. I'm also not that familiar with
>> fixing issue related to 'release' function...
>>
>> ... So review with care :)
>> ---
>>   drivers/fsi/fsi-master-aspeed.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
>> index 8606e55c1721..4a745ccb60cf 100644
>> --- a/drivers/fsi/fsi-master-aspeed.c
>> +++ b/drivers/fsi/fsi-master-aspeed.c
>> @@ -373,14 +373,6 @@ static int aspeed_master_break(struct fsi_master *master, int link)
>>   	return aspeed_master_write(master, link, 0, addr, &cmd, 4);
>>   }
>>   
>> -static void aspeed_master_release(struct device *dev)
>> -{
>> -	struct fsi_master_aspeed *aspeed =
>> -		to_fsi_master_aspeed(dev_to_fsi_master(dev));
>> -
>> -	kfree(aspeed);
>> -}
>> -
>>   /* mmode encoders */
>>   static inline u32 fsi_mmode_crs0(u32 x)
>>   {
>> @@ -603,7 +595,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>>   	dev_info(&pdev->dev, "hub version %08x (%d links)\n", reg, links);
>>   
>>   	aspeed->master.dev.parent = &pdev->dev;
>> -	aspeed->master.dev.release = aspeed_master_release;
> 
> Odd, then what deletes this device structure when the release function
> wants to be called?  You should have gotten a big warning from the
> kernel when removing the device from the system at runtime, did you test
> this somehow?
> 
> This does not look correct at all.
> 
> greg k-h
> 

