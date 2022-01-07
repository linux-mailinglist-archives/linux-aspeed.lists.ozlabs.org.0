Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8DF486FBC
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Jan 2022 02:35:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVQlK4f8nz30MQ
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Jan 2022 12:35:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mrh3lTBf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mrh3lTBf; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVQlB0cvkz2yg4;
 Fri,  7 Jan 2022 12:35:15 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so5022273oti.11; 
 Thu, 06 Jan 2022 17:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ywgP16oIByxs3QRc1jRR8SDOEZAjX7UvCJxKV2kqOV4=;
 b=mrh3lTBfiCf9J3eoPKI+PHd5CE9aD3+kFjRQfweXdWxj2krX/eCoEgC7mVPKYr74gZ
 P/HEUv5RFc2St+AKt7HMKIMFEkr4FCRMn1fj7sygol6eKBjN+qjVF6mPw8QemvhQfQUX
 fy+fhqkdqps5pcjkrbYQY7br0upRvbac5nqLmAvkNT9mX3npgkWdp4+yJDMPIhidv567
 Y+Z1Xx4dp80BZ6SLHQIyDhWu9NFPdZ7dityC2PUpF1PjJDpLfLHynmPPUhQOWtK8/3ET
 quxN83kXsgTIyeRE63Kfp//5zNXmybkCy8FbmSjyxSpbJSbIYWfaD5mPZ+k3VOxb/olz
 afyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ywgP16oIByxs3QRc1jRR8SDOEZAjX7UvCJxKV2kqOV4=;
 b=yquvXzDvrivZnK2vNw+0SsKyO4ri4SXBqs/ab6atfHIFglPCTxldgSeMmUFuiCL3EU
 JSSM6lDOTWLOwcDmKr+yri4X4cjJQV3U0ZMUPpZy1M9I3xzXer6RZgZdSB7l5usEqF58
 NBmGJP/SfNCjzUzocAUSKmNzve7hrCXNFWfT+1lbW978Zx6vhwmkqC0vSVninmYo8R26
 hhm+KHkDXmEyo4fojg+RoqrzM4Me0EPtEP6EvtgNrvWcXzTJxrxPjecQp4n/P0Z7Koik
 oKZ8X4Lxe4RNq5l/626RvFdBZNehC4dYx4hHxsG7E4GC9JPV+8KmOLm/mK546HfOyQEK
 0M7w==
X-Gm-Message-State: AOAM530g/uWyXqQ3NFqfo7gJDVK++B0l40zUTFV4PbkBuYYyyDUmcN/q
 hH8e1FEyJclrfizcYeKGzMk=
X-Google-Smtp-Source: ABdhPJzeCW7OSrCBMsXcTSnyd7bsXkRM9ty/z7avlBtYxITWKpHY+umUnWdwBOBO03dkTdkW5XM2mA==
X-Received: by 2002:a05:6830:2:: with SMTP id
 c2mr44862275otp.341.1641519312889; 
 Thu, 06 Jan 2022 17:35:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k1sm658659otj.61.2022.01.06.17.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 17:35:12 -0800 (PST)
Subject: Re: [PATCH] fsi: Aspeed: Fix a potential double free
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <2cafa0607ca171ebd00ac6c7e073b46808e24f00.1640537669.git.christophe.jaillet@wanadoo.fr>
 <YcldM9sgYdjMYMtH@kroah.com> <20220106081418.GH7674@kadam>
 <f2ba50fd-5c6b-e905-17ed-541dcc98c6c1@roeck-us.net>
 <edd19014-3b99-fa0b-912b-e058c14401d8@wanadoo.fr>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6926bb63-836b-b37c-3605-d6df9992bfaf@roeck-us.net>
Date: Thu, 6 Jan 2022 17:35:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <edd19014-3b99-fa0b-912b-e058c14401d8@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-aspeed@lists.ozlabs.org, alistair@popple.id.au,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/6/22 10:35 AM, Christophe JAILLET wrote:
> Le 06/01/2022 à 18:25, Guenter Roeck a écrit :
>> On 1/6/22 12:14 AM, Dan Carpenter wrote:
>>> On Mon, Dec 27, 2021 at 07:29:07AM +0100, Greg KH wrote:
>>>> On Sun, Dec 26, 2021 at 05:56:02PM +0100, Christophe JAILLET wrote:
>>>>> 'aspeed' is a devm_alloc'ed, so there is no need to free it explicitly or
>>>>> there will be a double free().
>>>>
>>>> A struct device can never be devm_alloced for obvious reasons.  Perhaps
>>>> that is the real problem here?
>>>>
>>>
>>> I don't understand how "aspeed" is a struct device.
>>>
>>
>> -static void aspeed_master_release(struct device *dev)
>> -{
>> -    struct fsi_master_aspeed *aspeed =
>> -        to_fsi_master_aspeed(dev_to_fsi_master(dev));
>> -
>> -    kfree(aspeed);
>> -}
>>
>> So "dev" is embedded in struct fsi_master, and struct fsi_master is embedded
>> in struct fsi_master_aspeed. Since "struct device" is embedded, the data
>> structure embedding it must be released with the release function, as is done
>> here. The problem is indeed that the data structure is allocated with
>> devm_kzalloc(), which as Greg points out must not be devm_ allocated
>> (because its lifetime does not match the lifetime of devm_ allocated
>> memory).
> 
> Thanks a lot for the detailed explanation.
> Crystal clear for me now.
> 
> Do you want me to send a patch to remove the devm_ or will you?
> 

Sorry, I am way behind with code reviews. I won't have time to submit a patch.

Guenter
