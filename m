Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E095920E
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 03:10:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpStb5Cq0z2yGv
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:10:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Su3KwTWi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpStX0JHXz2xfT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 11:10:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724202609;
	bh=k2UhMuq9AgfXwSrjsV/wSrCsHwkjK+ktJnm72iPp9Z0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Su3KwTWi9rBdTnvNA9jisdV652D3jy5sfW+7SNmyrK8jcvNPV8YpQoBreCgwp6dBC
	 swJxgLOk3iYgsNoWJN5hjIKVtKxuj+Nv6/r5MsSGJDpplTVrzMJ0tu7NiSs+ABWQY+
	 H0qmi7Q2wSrOxa9bIIQFeaoCiXr0DSm1Zg77OgZ1lQRMSLO3cqwiNGxRrDVswejPxx
	 uZPhvjPK2fMOilxvfPc4KerkVGdU4HyhazgcgiELkGRUvrFMHmsyX5999q21RTxdbF
	 E8QdrDStMFKCN/m4sZpipNOr99ICNltocyyuUGcQ/2uxRQDrkZPEwFe7lFuZuGzhEm
	 kjXlamWEyY78Q==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2837864B84;
	Wed, 21 Aug 2024 09:10:07 +0800 (AWST)
Message-ID: <4e49f0c3a0ec4f1e508cae289f82ddbd02f9c0a6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] ARM: dts: aspeed: Harma: update sgpio line name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 21 Aug 2024 10:40:06 +0930
In-Reply-To: <20240820102904.1756785-3-peteryin.openbmc@gmail.com>
References: <20240820102904.1756785-1-peteryin.openbmc@gmail.com>
	 <20240820102904.1756785-3-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Tue, 2024-08-20 at 18:29 +0800, Peter Yin wrote:
> From: Peter Yin <peter.yin@quantatw.com>
>=20
> power-card-enable
> uart-switch-button
> power-fault-n
> asic0-card-type-detection0-n
> asic0-card-type-detection1-n
> asic0-card-type-detection2-n
> uart-switch-lsb
> uart-switch-msb
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

Can you please your author email consistent with your Signed-off-by
email? Currently this generates a checkpatch warning:

   Executing: ./scripts/checkpatch.pl --strict -g HEAD
   WARNING: From:/Signed-off-by: email address mismatch: 'From: Peter Yin <=
peter.yin@quantatw.com>' !=3D 'Signed-off-by: Peter Yin <peteryin.openbmc@g=
mail.com>'
  =20
Thanks,

Andrew

> ---
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts   | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> index 92068c65eae4..9db95a791128 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> @@ -566,7 +566,7 @@ &gpio0 {
>  	/*B0-B7*/	"","","","",
>  			"bmc-spi-mux-select-0","led-identify","","",
>  	/*C0-C7*/	"reset-cause-platrst","","","","",
> -			"cpu0-err-alert","","",
> +			"cpu0-err-alert","power-card-enable","",
>  	/*D0-D7*/	"","","sol-uart-select","","","","","",
>  	/*E0-E7*/	"","","","","","","","",
>  	/*F0-F7*/	"","","","","","","","",
> @@ -585,7 +585,9 @@ &gpio0 {
>  	/*O0-O7*/	"","","","","","","","",
>  	/*P0-P7*/	"power-button","power-host-control",
>  			"reset-button","","led-power","","","",
> -	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
> +	/*Q0-Q7*/
> +			"","","","",
> +			"","power-chassis-control","","uart-switch-button",
>  	/*R0-R7*/	"","","","","","","","",
>  	/*S0-S7*/	"","","","","","","","",
>  	/*T0-T7*/	"","","","","","","","",
> @@ -685,7 +687,7 @@ &sgpiom0 {
>  	"FM_BOARD_REV_ID2","",
>  	"FM_BOARD_REV_ID1","",
>  	/*H0-H3 line 112-119*/
> -	"FM_BOARD_REV_ID0","",
> +	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
>  	"","","","","","",
>  	/*H4-H7 line 120-127*/
>  	"","",
> @@ -716,9 +718,15 @@ &sgpiom0 {
>  	"cpu0-thermtrip-alert","",
>  	"reset-cause-pcie","",
>  	/*L4-L7 line 184-191*/
> -	"pvdd11-ocp-alert","","","","","","","",
> +	"pvdd11-ocp-alert","",
> +	"power-fault-n","",
> +	"asic0-card-type-detection0-n","",
> +	"asic0-card-type-detection1-n","",
>  	/*M0-M3 line 192-199*/
> -	"","","","","","","","",
> +	"asic0-card-type-detection2-n","",
> +	"uart-switch-lsb","",
> +	"uart-switch-msb","",
> +	"","",
>  	/*M4-M7 line 200-207*/
>  	"","","","","","","","",
>  	/*N0-N3 line 208-215*/

