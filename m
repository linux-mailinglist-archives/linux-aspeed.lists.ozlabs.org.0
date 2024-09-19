Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79097C276
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 03:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8J4d4ST9z2yFJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:35:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726709744;
	cv=none; b=FVqhxBek4/Vr7YL7lLCciGsZGA4n9qqV73BvQYmLK8wP9T8jeB1tsoxQalqcs9JJQz9g3xBA43/OfcIhbEOaH6wGwNZNydi2JAywfcQvItgr7e+b0MxEIODxlzL6QwHz40m4FlurjFA6t5SCf/XcamhC/mwbh+4GrGNjb5IEyApqo8omf+k/hNXynwYdOktkW6zB46ZX3ipgROh6Jh1xw68BS7UyQP8/tkPeIE0Xoc22y6Hed+/yCrxJBpd2OowAtRC9J87QcAbmV/Ux0EY15iZDJoxYe+E9YCv7vLcvwCQH2yF6wDcs+cpe8WhuPg2xBNM1g/8uwep2dF34Vgz/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726709744; c=relaxed/relaxed;
	bh=IExdDbZ/GMKRz8cAAHlrjM+Fc2bsSlmO4LT61IojNqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=li6rM6zLTQ93nhXsQfQ73ZGiLr0AzNb6sD4MdbRsKjYroJ40LSgpAe9IoKFI+TwieZ8S1ujJ/QvrvIebGHgkYRTtI1oTwD5nYHFowdBkkX6OSesZUYX1mTzrC2V1C7o+/LqehfZlXad7qnlecB5JL7/c2rfJ/Z1RKo9DEpCNpXijFu3NISsUiRKwqu94jc45zHO/cftO4ikDv5g7lHUd88Mi0wPGbWVsApDmkXqIGDl/UImdALUUH8pqZHC7ZvouBVVQVgrV5y1g7w9Onu0nFkI+7EWw66AqamjhgVMjBzQ34kl+cTeYEh5IoQkqkF/e4183bP/96dsq8v7hWZyYjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Tc7JR9sz; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Tc7JR9sz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8J4c0bvrz2xJ6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 11:35:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726709743;
	bh=IExdDbZ/GMKRz8cAAHlrjM+Fc2bsSlmO4LT61IojNqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Tc7JR9szReZ8ec5ByN9zY+qACCyQZRK8bB60hnp3PLNPwg7kwrb3feyUjgRhE9ll+
	 EVOsOV+OcL0wkH8r/H3+TBkfWZLEacLTCC3NC9JYsnYbaXIwSPilzhA72cqpiVlNRG
	 G3d7VX9EO3uZA1frkyQiOZBCZOeQapUcnblkNN0ETla8E5UzC54KSqH96BjZqAoEL6
	 qmDH9ET6o+SW5a23hsG1G9CKsU6td6iFRwUoygVwcIlWPwCwM8vIbEXWX6GlzpMc2N
	 TCpCBfxmLx5l+eVrpJVUo0PDBvJiaUPZVcKGcO16QjRdrQqlDIZ7tixiEzCM1uVdvR
	 EZK1F1R+Jl4/A==
Received: from [127.0.1.1] (ppp118-210-188-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 94CD065027;
	Thu, 19 Sep 2024 09:35:42 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240918101742.1346788-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240918101742.1346788-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemite4: Enable interrupt
 setting for pca9555
Message-Id: <172670974249.626583.5344001337825691927.b4-ty@codeconstruct.com.au>
Date: Thu, 19 Sep 2024 11:05:42 +0930
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 18 Sep 2024 18:17:41 +0800, Delphine CC Chiu wrote:
> Enable interrupt setting and add GPIO line name for pca9555 for the I/O
> expanders on Medusa board.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

[1/1] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
      commit: f2c5e6d55ee4f0a634d2ed0427f55b81cfca8f2f

--
Andrew Jeffery <andrew@codeconstruct.com.au>

