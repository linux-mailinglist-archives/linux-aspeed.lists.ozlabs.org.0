Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21C11367
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:33:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vlp53ysmzDqRM
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 16:33:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="vM9NJvRe"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vlp02ShMzDq99
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:33:27 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BAF19D836EF;
 Thu,  2 May 2019 01:33:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id x1wmxZfVKuxB; Thu,  2 May 2019 01:33:22 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 29835D836EC;
 Thu,  2 May 2019 01:33:22 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 29835D836EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556778802; bh=tcIp7AhNkoEwN0gFSsX+la7g+NW6SBDZRQyZLHSqbRA=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=vM9NJvRerywk4FTAOmkU7aRPDvey+1frr+mNRGlF7Cw/wp0LbWzKCrB+8bJAu/4Jn
 t6U/JE2Ik/pLCWOjh1S8Iguu4MFmo/JTB2JcSw7JY+0Sgi5E872UKtBYY3t6mf8iRp
 2dLS9AGFGg/3i2YpU4ylHvhkleK/J2vOSaTnd9BY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iIZsH0zdJydL; Thu,  2 May 2019 01:33:22 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 01EA8D83726;
 Thu,  2 May 2019 01:33:22 -0500 (CDT)
Date: Thu, 2 May 2019 01:33:21 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Andrew Jeffery <andrew@aj.id.au>
Message-ID: <1991472336.3446950.1556778801333.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
References: <236762130.3394112.1556751009128.JavaMail.zimbra@raptorengineeringinc.com>
 <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
Subject: Re: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial
 outputs on AST2500 devices
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Topic: aspeed/pinctrl: Fix simultaneous DVO and serial outputs on
 AST2500 devices
Thread-Index: iVVT444UeYJbIlynU9p6TeIjxqHVqA==
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Andrew Jeffery" <andrew@aj.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linux-aspeed" <linux-aspeed@lists.ozlabs.org>, "Ryan Chen"
> <ryan_chen@aspeedtech.com>
> Sent: Thursday, May 2, 2019 12:51:00 AM
> Subject: Re: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial outputs on AST2500 devices

> On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
>> There appears to be a significant error in the pinmux table starting on
>> page 127 of the AST2500 datasheet v1.6.  Specifically, the COND2 (DVO)
>> requirement is incorrectly applied to multiple digital video input (DVI)
>> muxed pins, and no DVI-specific condition is provided.  This results in
>> the serial devices incorrectly overriding the DVO pinmuxes and disabling
>> the DVO pins.
>> 
>> Create a new condition code (COND6) for DVI enable, and update the most
>> seriously affected pins to use the new condition code.
>> 
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>> ---
>>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
>> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
>> index 6f357a11e89a..676f90d3c5f3 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
>> @@ -29,6 +29,7 @@
>>  
>>  #define COND1		{ ASPEED_IP_SCU, SCU90, BIT(6), 0, 0 }
>>  #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
>> +#define COND6		{ ASPEED_IP_SCU, SCU90, GENMASK(5, 4), 0, 0 }
>>  
>>  /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
>>  #define LHCR0		0x20
>> @@ -660,8 +661,8 @@ SSSF_PIN_DECL(T2, GPIOL0, NCTS1, SIG_DESC_SET(SCU84, 16));
>>  
>>  #define T1 89
>>  #define T1_DESC		SIG_DESC_SET(SCU84, 17)
>> -SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND2);
>> -SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND2);
>> +SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND6);
>> +SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND6);
> 
> I feel like you didn't test this patch, because VPI_24_RSVD_DESC (the DVI
> condition)
> requires SCU90[5]=0b1, but your introduction of COND6 requires SCU90[5:4]=0b00
> for
> the mux configuration to succeed. This can't work - bit 5 of SCU90 can not
> simultaneously take the values 1 and 0.

That's correct -- I don't have hardware that supports DVI available to test with.

> Ryan: Can we just drop the COND2 requirement for function 2 of balls T1, U2, P4
> and P3?
> I think that gets us where we need to be?
> 
> Cheers,
> 
> Andrew
> 
>>  MS_PIN_DECL(T1, GPIOL1, VPIDE, NDCD1);
>>  FUNC_GROUP_DECL(NDCD1, T1);
>>  
>> @@ -674,22 +675,22 @@ FUNC_GROUP_DECL(NDSR1, U1);
>>  
>>  #define U2 91
>>  #define U2_DESC		SIG_DESC_SET(SCU84, 19)
>> -SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC, COND2);
>> -SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND2);
>> +SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC, COND6);
>> +SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND6);
>>  MS_PIN_DECL(U2, GPIOL3, VPIHS, NRI1);
>>  FUNC_GROUP_DECL(NRI1, U2);
>>  
>>  #define P4 92
>>  #define P4_DESC		SIG_DESC_SET(SCU84, 20)
>> -SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC, COND2);
>> -SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND2);
>> +SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC, COND6);
>> +SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND6);
>>  MS_PIN_DECL(P4, GPIOL4, VPIVS, NDTR1);
>>  FUNC_GROUP_DECL(NDTR1, P4);
>>  
>>  #define P3 93
>>  #define P3_DESC		SIG_DESC_SET(SCU84, 21)
>> -SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC, COND2);
>> -SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND2);
>> +SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC, COND6);
>> +SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND6);
>>  MS_PIN_DECL(P3, GPIOL5, VPICLK, NRTS1);
>>  FUNC_GROUP_DECL(NRTS1, P3);
>>  
>> --
>> 2.11.0
