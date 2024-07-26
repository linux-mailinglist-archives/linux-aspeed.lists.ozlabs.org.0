Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5993CDE2
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 08:00:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=foWbyEGq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVcYt1wCfz3dGt
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 16:00:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=foWbyEGq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVcYn5fkMz3cHH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 16:00:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721973645;
	bh=QdbI3N7Rn42gDGMrzJpsnfGLEwUVSd33OvGXdiMpLbM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=foWbyEGqPuTHASdBk94cKFKPR3WFpX+tk6hU/jIRiOtsHWML8oxuj1NPRaFhBEZsR
	 fRAdgvwqOK3/fb09Vav319CW26jnzdg+uae712ROIV79s1ppn7TXIDPiHDKkwNbLb7
	 sPMeiTMuwstFejO7k3rM9O2sKuVnF3HouebVCTk8n0j9FrxVNOEo2e5swpNjwutei3
	 EyqeqXcjP3TsSDImTOOHIr6eAt/dsruPBUNGHeOQm/g1PKSNyerQBkRRMWWpvjXYr3
	 N258giOsjwxKI/gIoQzj4POi+VM9XqiFjKV81BlSN75J4BpYwhTyoD4ct0XOLHvqbT
	 R4ClGeVYgGopg==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 577B566AB4;
	Fri, 26 Jul 2024 14:00:44 +0800 (AWST)
Message-ID: <a4c2a2c25c7582b7b45fc42662b60c589b4748d4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: minerva: add host0-ready pin
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Yang Chen <yangchen.openbmc@gmail.com>, joel@jms.id.au,
 patrick@stwcx.xyz,  amithash@meta.com,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Date: Fri, 26 Jul 2024 15:30:43 +0930
In-Reply-To: <20240711130501.2900301-2-yangchen.openbmc@gmail.com>
References: <20240711130501.2900301-1-yangchen.openbmc@gmail.com>
	 <20240711130501.2900301-2-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-07-11 at 21:05 +0800, Yang Chen wrote:
> Add host0-ready pin for phosphor-state-manager.
>=20
> Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> index f5ac248097b4..41e2246cfbd1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> @@ -613,7 +613,7 @@ &gpio0 {
>  	/*P0-P7*/	"","","","","","","","",
>  	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
>  	/*R0-R7*/	"","","","","","","","",
> -	/*S0-S7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","","","","","","host0-ready",
>  	/*T0-T7*/	"","","","","","","","",
>  	/*U0-U7*/	"","","","","","","","",
>  	/*V0-V7*/	"","","","","BAT_DETECT","","power-chassis-good","",

Thanks, I've applied this to a tree for Joel to pick up.

Andrew
