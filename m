Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ADC97B66F
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 02:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7fd20qJRz2yLB
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 10:28:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726619281;
	cv=none; b=Zi9JY8GpI2kIfZl/L1JvYynJuDzF/gT+nyOWERfI29eG/WKa/F6XA6d8RKehnR2NvkQPsibQiFDVoM4wRTRO7wHGMbBPzdA2l3YwIqEfJWvvxXJ8DgVbysQaXHvg3oSr/NB7WmjlohBmecL4yoqVA6jYQ5mGBBbDiE56sTASlq0oRiv4zhNCO0s1bh1jrKXn+HZPlrWyW0t2oGjalSySCE2QSxWnpwwQZO180kfDRYTLU2n6Gene0m4LnCSeOOKxA1do3uCU+CmT1+RT3eLYVzSXJ2dprPYCah6lqf28p8EqTRkwKZUmxLtYQXKileN6S/0Sgt/+YXRmqMKDzU+qYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726619281; c=relaxed/relaxed;
	bh=PSQZulomhTTLDjFgGjKQiLSCRHAwcfGzNEoRqNraszM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S3LMaloUxT5lwvsn3WJHNXC6St7AChMTXcj0/TP5Wh94u/W7KkURnQmzFoLRWDfgh/9Sl/95ITQVdmRD4RkNhKhxjrF5krlWRKDfIcww8hmkAIbsaCwcqe+bFczB5bpS1GNnvuDERcK576zDUxVJfOmdp6ppKfxSHXMpXFLKojD07kMtuUEMVzgPVCX+hz82N4VbseRqThJT1BsSyvDJVDSf0yhNRKPtsXka/Lz4ejeC9vXf7cK3Q9WVoC9ntMLAK2NiFo+eOeZ1vtg/hRoFIZwG+rRmrHL/kXVccvf4tDzi3khMzEvxjplPOB3P+TKtgA3M0Xn/pD24Jvz8nJVBCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=i3awoUv2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=i3awoUv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7fcw3Mdwz2xJ5
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 10:27:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726619277;
	bh=PSQZulomhTTLDjFgGjKQiLSCRHAwcfGzNEoRqNraszM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=i3awoUv2X95+pLFwbNifY1iPdqIqhD3GsOYEdqqSkKKgbnaCtgWzlYOC1TyIAbVkK
	 4RQLkpBFS5lHy2hgm+A4OoQ2ZXdTLRErVlTLkI2oT1etnwYchQSshdiq6jdvm8XSyP
	 IDN3UzIqAwW+gYpsfuYbM/QKF0odg87WJXOmbHzxyu71Guljs0VqYzpjpLT5ydAeWS
	 Q2F7K6jMCnsLDqYhC3UEiNZsHwp861rLoU0KV7Tvi+paZev+S2+Pd3TGAwVcD4gcx7
	 VBTm6w/b/REhwwzSpv+VHXBEWdVC4mCDT+XHXcSCup0GoUzfSZPrIfMm/ZYb43FV0q
	 OTfqQ5Q5Q0/xA==
Received: from [127.0.1.1] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E5FB065027;
	Wed, 18 Sep 2024 08:27:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240917162100.1386130-1-eajames@linux.ibm.com>
References: <20240917162100.1386130-1-eajames@linux.ibm.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED
 names
Message-Id: <172661927571.3432555.2039083339536065640.b4-ty@codeconstruct.com.au>
Date: Wed, 18 Sep 2024 09:57:55 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 17 Sep 2024 11:21:00 -0500, Eddie James wrote:
> Blueridge LED names to include the "led-" prefix as is proper.
> Rainier should match for ease of application design. In addition,
> the gpio line name ought to match.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

[1/1] ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED names
      commit: bb5d0b3ea047506a8a55dec5f39977bd05a4ac98

--
Andrew Jeffery <andrew@codeconstruct.com.au>

