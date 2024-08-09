Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C696094CAED
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2024 09:06:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VGjNi0Fr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgFLp5Hzvz2yhM
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2024 17:06:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VGjNi0Fr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgFLg1bLRz2yY0
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Aug 2024 17:06:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723187162;
	bh=+Plf4ZWD1RmGz+3DAbjeVsVnM/ML3T/p7cds+xmG834=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VGjNi0Fr51RRWjZ85KwHn4LpSxGwfFn0x0KJYWbBgbau5d0F2NDAsZLLoK4xjYoHb
	 Kz/YPn1YOsQc7IprBQko/zOuC7dCMYzXe4hRlx86my7Tk/XkLsLLVZBtvJ706c7TA2
	 8CMOeOm+WLZdXu4UdTNxPR9cFmlKZ4Ze77IWGovesolHj4eNrMrBjXQW7EbuxR48dk
	 G/o/fNIhd6bxM3blbK6M/FnZGTRIW35GogfKWY+uyFUzjNvmhjf1ywjc1VeO0pKtiv
	 cyiZ2elprPghg041ZFDk5NBx+sk9WfYfnmWN5bMPIgmq97zGbKvGTbbkW+GskbxaTK
	 0QBd5QB5JW2JA==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8308D656AB;
	Fri,  9 Aug 2024 15:06:01 +0800 (AWST)
Message-ID: <3ace8d9363265449acc124316b9a76b9f8d095a9.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/7] ARM: dts: aspeed: Miscellaneous devicetree cleanups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Eddie
 James <eajames@linux.ibm.com>
Date: Fri, 09 Aug 2024 16:36:00 +0930
In-Reply-To: <20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au>
References: 	<20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-08-02 at 13:55 +0930, Andrew Jeffery wrote:
> Hello,
>=20
> As mentioned elsewhere the Aspeed devicetrees are in a bit of a sad
> state. This series is a collection of fixes that make them a little
> less so.
>=20
> If there no concerns raised in the near future I'll queue them up for
> the BMC tree.
>=20
> Andrew
>=20
> ---
> Andrew Jeffery (7):
>       ARM: dts: aspeed: Fix coprocessor interrupt controller node name
>       ARM: dts: aspeed: Specify correct generic compatible for CVIC
>       ARM: dts: aspeed: Specify required properties for sram node
>       ARM: dts: aspeed: Remove undocumented XDMA nodes
>       ARM: dts: aspeed: Clean up AST2500 pinctrl properties
>       ARM: dts: aspeed-g6: Use generic 'ethernet' for ftgmac100 nodes
>       ARM: dts: aspeed-g6: Drop cells properties from ethernet nodes

I've applied these to be picked up through the BMC tree.

Andrew
