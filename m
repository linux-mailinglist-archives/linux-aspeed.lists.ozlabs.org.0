Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A138A5F12
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Apr 2024 02:02:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L5w9kCgA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJPPN6G28z3dV3
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Apr 2024 10:02:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L5w9kCgA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJPPF3VZxz3bmY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Apr 2024 10:02:40 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B2D602014E;
	Tue, 16 Apr 2024 08:02:37 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713225759;
	bh=qp6e9gVW8p3TK5F1suQj7LLSwxDYkMTFB972FuHzieE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L5w9kCgAZA9lKpSQxqytaD7fmmFikGqvU4ejAiOXsrfQvjyGXn2oXEPDHdM+ldRge
	 3GcE627yUxHhtsqFeEQvjJ7zSRflbKo91a+889Rti95U7q/c0fNBLYxMG40UHc3Gmt
	 C+UTZ8xzhTc+rNoTrWk7AoeSa9YQhAiZUg3q0R1+xdi8Td853fs4jcCePChNxOhixo
	 1rh+tvj2PdmxFrjUqtXTZFUKmR+QyowYJf5Xa5adx6oJ/n3fYyLoBpi6pVu7/h+1vU
	 CrckNE57UyMDMHbuU2wptYQlEJHWUaFNa2RDTBtRXgpHKB+SdRzOkGX3wHJtdfkjE2
	 vsoVYS9aOd+fg==
Message-ID: <48ad6bcccae315e68bc0aa10669eed645c495139.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add IBM P11 BMC boards
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Date: Tue, 16 Apr 2024 09:32:30 +0930
In-Reply-To: <20240415154931.10775-1-eajames@linux.ibm.com>
References: <20240415154931.10775-1-eajames@linux.ibm.com>
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
Cc: lakshmiy@us.ibm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-04-15 at 10:49 -0500, Eddie James wrote:
> Add the Blueridge and Fuji BMC systems.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>  - Change "ody" to "odyssey"
>=20
>  arch/arm/boot/dts/aspeed/Makefile             |    2 +
>  .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1752 +++++++
>  .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 4016 +++++++++++++++++
>  .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1704 +++++++
>  4 files changed, 7474 insertions(+)

A few points:

- Altogether this patch is pretty large. Can we do one for each of the
FSI topology and the platforms?

- The only list to which you've sent the patch is linux-aspeed, which
doesn't appear to be archived on lore. Can you please add at least one
that is? There are a few that should probably be included regardless.

- I don't plan to merge the patch until it has had review from ideally
more than one other IBMer

On the review front:

It looks like you still need to update
Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml with the new
platform compatible strings.

Also, can you please run=C2=A0

```
make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-{blueridge,fuji}.dtb
```

and address the warnings? This is best done by first applying the patch
on top of my tree below. It goes some way to eliminating many of the
warnings currently produced for the Aspeed BMC SoCs:

https://github.com/amboar/linux/tree/dt-warnings/all

Andrew
