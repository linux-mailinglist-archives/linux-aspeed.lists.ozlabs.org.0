Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2380191B
	for <lists+linux-aspeed@lfdr.de>; Sat,  2 Dec 2023 01:44:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=0W7GSsCG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShrmC3Q94z3cVD
	for <lists+linux-aspeed@lfdr.de>; Sat,  2 Dec 2023 11:44:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=0W7GSsCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rnplus.nl (client-ip=178.251.25.70; helo=mail.rnplus.nl; envelope-from=renze@rnplus.nl; receiver=lists.ozlabs.org)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Shrm64kvMz3bxZ
	for <linux-aspeed@lists.ozlabs.org>; Sat,  2 Dec 2023 11:44:22 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 0FEA037943A
	for <linux-aspeed@lists.ozlabs.org>; Sat,  2 Dec 2023 00:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nAKLDXYu5PCu for <linux-aspeed@lists.ozlabs.org>;
	Sat,  2 Dec 2023 01:45:56 +0100 (CET)
Received: from werkpc.localnet (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id B90863793AD;
	Sat,  2 Dec 2023 01:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701477956; bh=yRBPEQxU6QTn7AumN8CC7LcN7WuQwY78yyLiGx2740g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=0W7GSsCGwYC8FMG7Ils5SuWyAqyZJGF8bDINj62Wqb53kV2eBh6mstVrI+f4phf/I
	 6FdLKR168fsp2mZBV1EVnedjh6vFwfmvY2DxrSpFNCbAI8h0q9V3+9AREQe7M4IlYx
	 BYCR+gz0WJ2UOmyxJgVaMMPUQBUSTZuGEyDbk2Xg=
From: Renze Nicolai <renze@rnplus.nl>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 renze@rnplus.nl
Subject: Re: [PATCH v3 0/2] ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
Date: Sat, 02 Dec 2023 01:44:17 +0100
Message-ID: <12332130.O9o76ZdvQC@werkpc>
In-Reply-To: <20231202003908.3635695-1-renze@rnplus.nl>
References: <20231202003908.3635695-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello again,

A small addition to my cover letter for v3 of the patch:

I forgot to mention in the changelog from v2 to v3 that I also modified the 
tachometer configuration to correctly map the tachometer inputs to the fan 
headers on the board.

Greetings,
Renze Nicolai

On Saturday, December 2, 2023 1:38:43 AM CET you wrote:
> Hello,
> 
> These patches add a device-tree (and a bindings update) for the
> Aspeed BMC on the ASRock X570D4U, so that it can be added as a
> supported OpenBMC platform.
> 
> Changes since v2:
>   - Renamed leds to led-0 and led-1 to match
> Documentation/devicetree/bindings/leds/leds-gpio.yaml - Added aliasses and
> labels for the i2c-mux on i2c bus 4
>   - Added the missing blank line between the ehci1 and uhci nodes
> 
> Greetings,
> Renze Nicolai
> 
> Renze Nicolai (2):
>   dt-bindings: arm: aspeed: add Asrock X570D4U board
>   ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 377 ++++++++++++++++++
>  3 files changed, 379 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts




