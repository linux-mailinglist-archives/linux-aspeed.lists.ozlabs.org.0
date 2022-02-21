Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A724BEA35
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 19:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2VqW2NyFz3c79
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Feb 2022 05:16:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.130; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2VqM2C9xz30KR
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Feb 2022 05:16:13 +1100 (AEDT)
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id MD6uno17DHZHJMD6unoA5U; Mon, 21 Feb 2022 19:08:39 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 21 Feb 2022 19:08:39 +0100
X-ME-IP: 90.126.236.122
Message-ID: <79bdf543-4882-360e-567f-493e84f09d6b@wanadoo.fr>
Date: Mon, 21 Feb 2022 19:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] fsi: Aspeed: Fix a potential double free
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <2c123f8b0a40dc1a061fae982169fe030b4f47e6.1641765339.git.christophe.jaillet@wanadoo.fr>
 <CACPK8XfxZRXtU0Bn+f0=B3CGUE8A8i9Ob_a9=2t=TzLc5a+75w@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CACPK8XfxZRXtU0Bn+f0=B3CGUE8A8i9Ob_a9=2t=TzLc5a+75w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kernel-janitors@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Alistar Popple <alistair@popple.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le 21/02/2022 à 10:24, Joel Stanley a écrit :
> Hi Christophe,
> 
> Thanks for the patch.
> 
> On Sun, 9 Jan 2022 at 21:56, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> A struct device can never be devm_alloc()'ed.
>> Here, it is embedded in "struct fsi_master", and "struct fsi_master" is
>> embedded in "struct fsi_master_aspeed".
>>
>> Since "struct device" is embedded, the data structure embedding it must be
>> released with the release function, as is already done here.
>>
>> So use kzalloc() instead of devm_kzalloc() when allocating "aspeed" and
>> update all error handling branches accordingly.
> 
> This looks like a problem with the design of the fsi master structure.
> It's a common pattern to devm_alloc the platform devices as they are
> probed, the fsi masters all embed a copy of struct fsi_master, which
> as you say embeds struct device.
> 
> Can we learn from other bus drivers (eg i2c?) how we should lay out
> these structures?
> 
Hi,
I won't do it myself.

This goes beyond my knowledge and without the possibility to test it, it 
would be just some random trial and error (as I did in the first broken 
version of this patch).

CJ
