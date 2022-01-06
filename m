Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC92488E6B
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 02:55:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH3M6xstz2xsK
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 12:55:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.124; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVFcC6wGLz2yfc
 for <linux-aspeed@lists.ozlabs.org>; Fri,  7 Jan 2022 05:43:38 +1100 (AEDT)
Received: from [192.168.1.18] ([90.11.185.88]) by smtp.orange.fr with ESMTPA
 id 5XcCn6oLyBazo5XcDn2y4b; Thu, 06 Jan 2022 19:36:03 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 06 Jan 2022 19:36:03 +0100
X-ME-IP: 90.11.185.88
Message-ID: <edd19014-3b99-fa0b-912b-e058c14401d8@wanadoo.fr>
Date: Thu, 6 Jan 2022 19:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] fsi: Aspeed: Fix a potential double free
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <2cafa0607ca171ebd00ac6c7e073b46808e24f00.1640537669.git.christophe.jaillet@wanadoo.fr>
 <YcldM9sgYdjMYMtH@kroah.com> <20220106081418.GH7674@kadam>
 <f2ba50fd-5c6b-e905-17ed-541dcc98c6c1@roeck-us.net>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <f2ba50fd-5c6b-e905-17ed-541dcc98c6c1@roeck-us.net>
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
Cc: linux-aspeed@lists.ozlabs.org, alistair@popple.id.au,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le 06/01/2022 à 18:25, Guenter Roeck a écrit :
> On 1/6/22 12:14 AM, Dan Carpenter wrote:
>> On Mon, Dec 27, 2021 at 07:29:07AM +0100, Greg KH wrote:
>>> On Sun, Dec 26, 2021 at 05:56:02PM +0100, Christophe JAILLET wrote:
>>>> 'aspeed' is a devm_alloc'ed, so there is no need to free it 
>>>> explicitly or
>>>> there will be a double free().
>>>
>>> A struct device can never be devm_alloced for obvious reasons.  Perhaps
>>> that is the real problem here?
>>>
>>
>> I don't understand how "aspeed" is a struct device.
>>
> 
> -static void aspeed_master_release(struct device *dev)
> -{
> -    struct fsi_master_aspeed *aspeed =
> -        to_fsi_master_aspeed(dev_to_fsi_master(dev));
> -
> -    kfree(aspeed);
> -}
> 
> So "dev" is embedded in struct fsi_master, and struct fsi_master is 
> embedded
> in struct fsi_master_aspeed. Since "struct device" is embedded, the data
> structure embedding it must be released with the release function, as is 
> done
> here. The problem is indeed that the data structure is allocated with
> devm_kzalloc(), which as Greg points out must not be devm_ allocated
> (because its lifetime does not match the lifetime of devm_ allocated
> memory).

Thanks a lot for the detailed explanation.
Crystal clear for me now.

Do you want me to send a patch to remove the devm_ or will you?

CJ

> 
>> I've been working on understanding device managed memory recently for
>> Smatch.  It's really complicated.  There are a bunch of rules/heuristics
>> that I'm slowly creating to generate new warnings but I'm a long way
>> from understanding it well myself.
>>
> 
> A data structure embedding struct device must not be devm_ allocated,
> and it must be released with the release callback. Maybe there is
> a means to flag that somehow ?
> 
> Guenter
> 

