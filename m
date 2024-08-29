Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E130963BAA
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 08:30:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvWct3mxkz2ytT
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 16:30:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.68.75
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724913049;
	cv=none; b=CDtMagk81VUR+W+u/TbZj2JadcBFG5Sye0jfucTHyGnLK6bYcl0bYUOgvHtgXmqusyaSaY9Nk2duJIqcIpm7lSIRbKVnrgOhwjQ80T1sGQwrDugkRc3Sj35AcL3iY9XriBFNr/JgFCZcBY3KswFxyBI7Ifvzk7+E0DSfTbHlIO/b9fQTWa/WSylUHHLvZ+Fn5OU3uEYQWDzwF+YGcieGosOz9ySS6G3gyO2Nna2lXggJqpnRvTSkNi2P4lwB7gV9eNk7bogQbuIh8EGEEXuKmEgb1If/qBRbPs0oljqlUWLLeR6tPBBjQCrthxwVnLpRjxwO9YakVrvGe1Wdy16kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724913049; c=relaxed/relaxed;
	bh=XG6nT4BozRLkANgropmpnGP/rWeIgJUvZK9xi//CcUU=;
	h=X-Greylist:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mFYrowBIuXDtbvWi9KCS3iMjibh/m5E8dPq3g3Hbr+xsj8Eg53amif5k2X3lNm+r/BrrAEY6AYCnLSqJu16TwA0Um+Vx5VZFLxXPBLSg5Zw5FBbI3OEu3zU/uBQH/0eVbh4RPYNNWNnt+oa1CQyY2FcuKEq7WKN7PqaO46hZ+rHqBfm8LJsWPGMFvHhhLlj1EfiMXlMPXoUPpwqcDPUOATco0k/dtBMP+4+znc4dSQuF08wJmgw8KjjHiGE49S/VufRgFj33t7V7lvyl8p0HvsQxrFR3MvDk508UI/uKJwjtkREfedpNw7fDV6XJMI/WoWx7nMMSPdDE8OjCGeLINA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H3GMyppe; dkim-atps=neutral; spf=pass (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H3GMyppe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 439 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 16:30:49 AEST
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvWcn0rmCz2yYK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Aug 2024 16:30:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DB2AAAE41BF;
	Thu, 29 Aug 2024 06:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5967C4CEC7;
	Thu, 29 Aug 2024 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912604;
	bh=U5KWoMkfnuFk72Vmblbci9PFkDZZdASH00vXuyhhx+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3GMyppe/R593iDYjabEa4aNOCtnmhepV9P603aZsfJ0Azjxi6Sos3hFQDL3nAmFP
	 MJ2aNojvaU6gztWrnBQkDScW8ALTlb48m0KQmG2tj/RSpUc9R+JrPl+e7FK1W6kDg2
	 3jAHDce3MOi/VqWrjdw8iPuYR+WCKHGg5QFCSYS/vdJxwXk8LSuaw75iYLGe1pm8ky
	 aJEKij1HVhKYQV0aXcYN2BiF+Alf5IrHGgB7K3/C1o+Bv1dmGVlJPAuHAl+fh4gBIQ
	 hGU/yG5PYs0KrrRw9u9JpP6h2M8jIMKfmAFgODetS3fUBPC4Oq6n/jewzZIZ7xw6kZ
	 EgM0tkHXLN6PA==
Date: Thu, 29 Aug 2024 08:23:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] Add support for AST2700 clk driver
Message-ID: <t224vq3mnwwddpmpyi4ajpsippwcj3rc53li6bkccr4s5tf5y7@fjhthwzqhgqy>
References: <20240828062740.1614744-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828062740.1614744-1-ryan_chen@aspeedtech.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2024 at 02:27:37PM +0800, Ryan Chen wrote:
> This patch series is add clk driver for AST2700.
> 
> AST2700 is the 8th generation of Integrated Remote Management Processor
> introduced by ASPEED Technology Inc. Which is Board Management controller
> (BMC) SoC family. AST2700 have two SoC connected, one is SoC0, another
> is SoC1, it has it's own scu, this driver inlcude SCU0 and SCU1 driver.
> 
> v2:
> -yaml: drop 64bits address example.
> -yaml: add discription about soc0 and soc1
> -dt-bindings: remove (), *_NUMS, reserved.
> -dt-bindings: remove dulipated define number
> -clk-ast2700: drop WARN_ON, weird comment.

As LKP pointed out, this fails on certain static tests. It is expected
that new drvier will pass the open/free static analysis tools we use in
the kernel.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1. Most of these commands (checks or W=1
build) can build specific targets, like some directory, to narrow the
scope to only your code. The code here looks like it needs a fix. Feel
free to get in touch if the warning is not clear.

Best regards,
Krzysztof

