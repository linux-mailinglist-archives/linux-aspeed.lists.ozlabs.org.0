Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190D975F45
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X427t0nmYz2yRP
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:53:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726109623;
	cv=none; b=IClTiMqzFBgZqSmj88YOmDuvOn0zaQsdHvQhwPAgr0RsFjaxclVXTq3XQ3vVd2VKrRDm3j5+0RqQjPyMBlG+/hc9wAIq6wfGKpwGBNgtG5mSWhHAT7o3IPIWX7S/GTEwYq+Pcu4l5Tk6pYTnKqdWf6G9WEdq3swy1f9pD7J7O2FoDqukBIegoyuYCKwW0qa5Z1MyVVQ5qCAHh9fKSAF2e0dya3HUsf7hyK5SrFnMIDXyBtkNfD9r9VdeX1mioYJd+ZSobFqcNBcap4mhODz2wqgFJo8UA/oQ7vGB/ah9tiYqFi32xa2yuDVE+oxmVl5Iqrq/vueg09qXqdWIiIMQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726109623; c=relaxed/relaxed;
	bh=yn+wZNBElEbo6z6rUQ2iwm+eHVU5SkpgkGRmFBHXQcM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T80gv0cg3MmV5MXRglR5nHTx8fO1J6owX2HdIVIeK3MzJ02ofBSRkTeo9rzLcjVnysI9qjWfZiQ7TmS55vRl2xPY3De4COW9fb0D9O+XzKYtHN9A6wr7Zj5ElBC7iz4Iem08mG6GKc3vAE+fmp1z1AifWKL9NlK8UmQtwWWaNI8/WG2Z+ehR3DGuahM+ko2yk6ZrlSvbCED/TosHOPHgSE+ptcTbcpfNheFHvThFFQXktYgUYWYGNYbZe19T1cApqQiQXzdIUsatmJIVq9C/gV9uASHfN2NppTwgpwEuXGvEqNgeTQU1UERd1Cct/z1MN/vhdIEnWWAYUAWXQVF9Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ilUpuQ+B; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ilUpuQ+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X427q0Wkmz2y8F
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:53:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726109621;
	bh=yn+wZNBElEbo6z6rUQ2iwm+eHVU5SkpgkGRmFBHXQcM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ilUpuQ+BG4JQkm0ACs1v0T8cQFZBf8biCQCHBV9Jn7knEyQxdWd0LmQgrsAmSBw6o
	 VliAn36FHdSeEZmEnADy+XEPbWz+VM3csvcecFsiQW6xW7fxREpQjDjiJRIDxTyTvF
	 RpwRy70gazvGGFpPZrGjFMyuTsSeP3i7rkeM4DgDoK8/EB4szIE3AM8uwWuP5/w7Jg
	 rgXTljqDMFYwesL/d29Ca60cLlXpF7g84YJv8zRjLG71aMG7KP6VFDtWHmsB+ZGYer
	 k7zfkdyXZJcnylPpOzCWrlGTAqzHx0lTgtX1k+inZTXjC6iB40UllEuFveEddIM5j0
	 dwDy2VeMgu8HQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 236B3650D6;
	Thu, 12 Sep 2024 10:53:39 +0800 (AWST)
Message-ID: <908b7765584f96299c720c0d8312839a520a0e48.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Harma: revise sgpio line name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 12 Sep 2024 12:23:38 +0930
In-Reply-To: <20240909080459.3457853-3-peteryin.openbmc@gmail.com>
References: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
	 <20240909080459.3457853-3-peteryin.openbmc@gmail.com>
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

On Mon, 2024-09-09 at 16:04 +0800, Peter Yin wrote:
> power-card-enable
> power-fault-n
> power-hsc-good
> power-chassis-good
>=20
> asic0-card-type-detection0-n
> asic0-card-type-detection1-n
> asic0-card-type-detection2-n
> presence-cmm
>=20
> uart-switch-button
> uart-switch-lsb
> uart-switch-msb
>=20
> reset-control-cmos-clear

Can you please try to be more descriptive in the future? However, for
now, I've applied the series to be picked up through the BMC tree.

Andrew

>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 36 +++++++++----------
>  1 file changed, 16 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> index 92068c65eae4..9cb511a846e3 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> @@ -393,12 +393,6 @@ gpio@31 {
>  		reg =3D <0x31>;
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> -
> -		gpio-line-names =3D
> -		"","","","",
> -		"","","presence-cmm","",
> -		"","","","",
> -		"","","","";
>  	};
> =20
>  	// PTTV FRU
> @@ -422,12 +416,6 @@ gpio@31 {
>  		reg =3D <0x31>;
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> -
> -		gpio-line-names =3D
> -		"","","","",
> -		"","","presence-cmm","",
> -		"","","","",
> -		"","","","";
>  	};
> =20
>  	// Aegis FRU
> @@ -566,7 +554,7 @@ &gpio0 {
>  	/*B0-B7*/	"","","","",
>  			"bmc-spi-mux-select-0","led-identify","","",
>  	/*C0-C7*/	"reset-cause-platrst","","","","",
> -			"cpu0-err-alert","","",
> +			"power-hsc-good","power-chassis-good","",
>  	/*D0-D7*/	"","","sol-uart-select","","","","","",
>  	/*E0-E7*/	"","","","","","","","",
>  	/*F0-F7*/	"","","","","","","","",
> @@ -585,14 +573,16 @@ &gpio0 {
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
>  	/*U0-U7*/	"","","","","","","led-identify-gate","",
>  	/*V0-V7*/	"","","","",
>  			"rtc-battery-voltage-read-enable","",
> -			"power-chassis-good","",
> +			"","",
>  	/*W0-W7*/	"","","","","","","","",
>  	/*X0-X7*/	"","","","","","","","",
>  	/*Y0-Y7*/	"","","","","","","","",
> @@ -673,7 +663,7 @@ &sgpiom0 {
>  	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
>  	"presence-asic-modules-1","bios-debug-msg-disable",
>  	"","uart-control-buffer-select",
> -	"","ac-control-n",
> +	"presence-cmm","ac-control-n",
>  	/*G0-G3 line 96-103*/
>  	"FM_CPU_CORETYPE2","",
>  	"FM_CPU_CORETYPE1","",
> @@ -685,7 +675,7 @@ &sgpiom0 {
>  	"FM_BOARD_REV_ID2","",
>  	"FM_BOARD_REV_ID1","",
>  	/*H0-H3 line 112-119*/
> -	"FM_BOARD_REV_ID0","",
> +	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
>  	"","","","","","",
>  	/*H4-H7 line 120-127*/
>  	"","",
> @@ -700,7 +690,7 @@ &sgpiom0 {
>  	/*I4-I7 line 136-143*/
>  	"","","","","","","","",
>  	/*J0-J3 line 144-151*/
> -	"","","","","","","","",
> +	"","","power-card-enable","","","","","",
>  	/*J4-J7 line 152-159*/
>  	"SLOT_ID_BCB_0","",
>  	"SLOT_ID_BCB_1","",
> @@ -716,9 +706,15 @@ &sgpiom0 {
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

