Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2307366389
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Apr 2021 04:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ3wt6H0Qz2yx2
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Apr 2021 12:12:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=jiapeng.chong@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Wed, 21 Apr 2021 12:12:43 AEST
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ3wq4K7Cz2xYj
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Apr 2021 12:12:41 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0UWFcIKt_1618970849; 
Received: from 30.13.161.100(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UWFcIKt_1618970849) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 21 Apr 2021 10:07:30 +0800
From: =?UTF-8?B?56eN5ZiJ6bmP?= <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] usb: gadget: aspeed: Remove unnecessary version.h includes
To: Greg KH <gregkh@linuxfoundation.org>
References: <1617681598-28165-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <YGvxAmHIgnRMcyuq@kroah.com>
Message-ID: <971ce789-9633-1799-6c55-50b79f2f179e@linux.alibaba.com>
Date: Wed, 21 Apr 2021 10:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YGvxAmHIgnRMcyuq@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2021/4/6 13:26, Greg KH wrote:
> On Tue, Apr 06, 2021 at 11:59:58AM +0800, Jiapeng Chong wrote:
>> "make versioncheck" shows:
>>
>> ./drivers/usb/gadget/udc/aspeed-vhub/hub.c: 33 linux/version.h not
>> needed.
> 
> Then you need to fix the tool, and always test-build patches before you
> send them out, as this is obviously wrong :(
> 
Sorry for the noise. We'll do more test-build towards patches next time.

