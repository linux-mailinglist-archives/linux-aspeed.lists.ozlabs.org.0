Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8169774FCF
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 02:29:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Mysbv6Ir;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL9sW6WjSz307s
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 10:29:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Mysbv6Ir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL9sQ3NKPz2y1h
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 10:28:58 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A4E9D20172;
	Wed,  9 Aug 2023 08:28:57 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1691540937;
	bh=KZQz3C4EK4svAfJjrGrSxyQuWjZmE8LD+H2VcJuXgmw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mysbv6IrcmrKmUowjZT/O2GUGqDVxT2o6q6SlMAcaEHU1AO3oOjGvWPAghvq46qaV
	 th8Crr7ZRgElbViQb5onYGUT4EF6Yqf2K+I53cUZm5hsl57VLJts7j31c8z/v06dJ+
	 iCwzbAPABRShFTXcl9mcvn9C7/XmP2JFtP42tDO5vshiFl+IH3qoU30wjWudyhohH7
	 9T/WnvEyKDUx0byTCfVtXeYi9YNzhvhBQp7pjOUKX2xLKZAa5IhXlGxUIuqz72MzIk
	 zvkcNAQe/fhEgB8Bf0jyot7zH7yOd4IEA8O0B9C7+OrWXKAGbWuLrXXQKwR2MVWJRC
	 7IeEXWzNBMdyA==
Message-ID: <a670192024911f7f2d676e245f5f240e9ed5126b.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, alexandre.belloni@bootlin.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  joel@jms.id.au, andrew@aj.id.au, p.zabel@pengutronix.de, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 09 Aug 2023 08:28:57 +0800
In-Reply-To: <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
	 <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Dylan,

> - with no changes needed to any bindings. I haven't needed any other
> resets; are there per-controller resets specified in the HW docs you
> have?

... keeping in mind the reset control that the aspeed SCU driver
already provides for you, when you enable the appropriate clock gate:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/clk/clk-aspeed.c#n224

Cheers,


Jeremy
