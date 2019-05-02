Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC3111E7
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 05:34:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vgqV4LVqzDqRJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 13:34:30 +1000 (AEST)
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
 header.b="nmWaNwqC"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vgqL3KfFzDqPC
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 13:34:21 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 119D1E02890;
 Wed,  1 May 2019 22:34:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sW3L1P_boy4I; Wed,  1 May 2019 22:34:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1DD42E02891;
 Wed,  1 May 2019 22:34:17 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1DD42E02891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556768057; bh=ywYMR9ZVp0MoECDr3XcubMSoZ/dilmm5JsK8j/81x/k=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=nmWaNwqCoFyUtuo7LY1VAywmSxZizsOvPzGgaxafUAAfG8TqdTs02Eh+E3ZDohbxy
 pwMPbEerdwP4zPd8uXRHWtNA/VJJ6fZarjKhY1QCKrbrxSlMrhzp2ABnds0DDzXx1F
 PfeKofQy0bh2C7CUGpFm9anUMPO3jKzDIyIGVkw4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zk9ReeHMqDEp; Wed,  1 May 2019 22:34:17 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id F2477E02890;
 Wed,  1 May 2019 22:34:16 -0500 (CDT)
Date: Wed, 1 May 2019 22:34:16 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <313461427.3426138.1556768056285.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
 <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
 <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
Subject: Re: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Topic: aspeed/pinctrl: Fix simultaneous RS-232 / PWM and DVO outputs on
 AST2500 devices
Thread-Index: AdUAlAXpS154mlgPT4yc4y3VL8kZB2RDAL2h
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

----- Original Message -----
> From: "Ryan Chen" <ryan_chen@aspeedtech.com>
> To: "Andrew Jeffery" <andrew@aj.id.au>, "Timothy Pearson" <tpearson@raptorengineering.com>, "linux-aspeed"
> <linux-aspeed@lists.ozlabs.org>
> Cc: "Morris Mao" <morris_mao@aspeedtech.com>
> Sent: Wednesday, May 1, 2019 10:06:25 PM
> Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and DVO outputs on AST2500 devices

>>On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
>> There appears to be a small error in the pinmux table on pages 130 and
>> 131 of the AST2500 datasheet v1.6.  Specifically, the COND2
>> requirement used to mux the surrounding pins to DVI was inadvertently
>> replicated to pins V1, W1, V2, and W2 in the table, which do not
>> incorporate DVI functionality.
>> 
>> As a result of this error, both serial TX lines and the PWM 0/1
>> outputs were overriding the VPO pinmux settings when VPO was enabled
>> in the pinmux hogs.
>> 
>> This patch has been verified to function on Blackbird hardware.  Both
>> serial TXD pins and PWM0/PWM1 were functionally tested with SCU94[1:0]
>> set to 0x1.
> 
> Hello Tim.
> 
> The AST2500 pwm0/1 configure need following condition, the SCU94[1:0] is 0x1, it
> should not work.
> Could you help confirm it?
> 
> v2 : pwm 0 : scu88[0] = 1 & scu 94[1:0] = 0 & scu90[5] = 0
> w2 : pwm 1 : scu88[1] = 1 & scu 94[1:0] = 0 & scu90[5] = 0

I can confirm that with SCU94[1:0] == 0x1 the PWM0 and PWM1 outputs work correctly -- this was tested on our Blackbird hardware.  If you are reading from the datasheet, I suspect there are a few errors in it relating to the relatively rarely used DVO mux settings.
