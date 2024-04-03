Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4EA8962E5
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 05:21:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NpflSBWd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8VQb6lD3z3d2S
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 14:21:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NpflSBWd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8VQT5wGlz30N8
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 14:21:21 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1806420075;
	Wed,  3 Apr 2024 11:21:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712114479;
	bh=ihCa6WKSA/WbdOR35DutY2Up4nYKVpfJqb5uMJHHlDg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=NpflSBWdGcgyEymG4qxPXgsd6Po5FikbCaLFEFc+dFj6qiCmHRtAelZtJOC6mtkOT
	 XoqEuPXAcdkwvNtRTbCZDNk5jwT3HVPEAWXTkJ+MQLXuX7zqy61sHBmCty1Vy+nUHS
	 Xizu2sPyHorbKBXLiCqUY4XOwdv4VvN1UeJ9yExMJWiDk5OrqZrLIuCdKVACeRQQJy
	 rH+iNXy6DY/hgdxtHGqzdzywjfvWY3wjC2zmYD66Vn51kjRnO6MYhz7gsH/uLwVeol
	 a26xaqyKvPMfiukImhUYN07ZoAzeWxoKcTsEkkMxhWbdcCJi+cTMEV4onc1IAb0SgC
	 FcMZp7vi8ouug==
Message-ID: <5f1c7ac66f0ae68bbab0011c1ab5b020ecdb16b6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] ARM: dts: Modify GPIO table for Asrock X570D4U BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Renze Nicolai <renze@rnplus.nl>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au,  andrew@aj.id.au
Date: Wed, 03 Apr 2024 13:51:06 +1030
In-Reply-To: <20240329130152.878944-2-renze@rnplus.nl>
References: <20240329130152.878944-1-renze@rnplus.nl>
	 <20240329130152.878944-2-renze@rnplus.nl>
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

Hi Renze,

Do you mind running this patch and the others in the series through
./scripts/checkpatch.pl? Generally patches sent to the list should not
generate warnings.

It looks like these patches are generated against Joel's bmc/for-next
branch. He's applied your original X570D4U devicetree patch there,
(though that also causes checkpatch warnings).

On Fri, 2024-03-29 at 14:01 +0100, Renze Nicolai wrote:
> This commit removes button-nmi-n, this board does not have support for an=
 NMI button.
> Input status-locatorled-n has been renamed to input-locatorled-n to bette=
r indicate the signal type.
> The suffix -n has been appended to the name of control-locatorbutton, but=
ton-power, control-power, button-reset, control-reset, input-id0, input-id1=
, input-id2, output-bmc-ready to reflect the inverted signal polarity.
> GPIO output-rtc-battery-voltage-read-enable has been renamed to output-hw=
m-vbat-enable, input-alert1-n to input-aux-smb-alert-n, input-alert3-n to i=
nput-psu-smb-alert-n, input-mfg to input-mfg-mode-n and input-caseopen to i=
nput-case-open-n.
> And GPIOs input-bmc-smb-present-n, input-pcie-wake-n, input-sleep-s3-n, i=
nput-sleep-s5-n and input-power-good have been added.
>=20

For instance, checkpatch warns about these lines in the commit message
being too long. They should be wrapped at 72 characters.

Additionally, the description forms a bit of a list of things the patch
is doing. Patches are easier to review when they only do one thing, as
it removes the need to assess whether there are subtle interactions
between the several things, and if so, whether they're expected and
correct.

I'd prefer this change be split up so there's no need for such
concerns.

> Signed-off-by: Renze Nicolai <renze@rnplus.nl>
> ---
>  .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 116 +++++++++---------
>  1 file changed, 58 insertions(+), 58 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
> index 3c975bc41ae7..34bc382bf492 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
> @@ -79,64 +79,64 @@ iio-hwmon {
>  &gpio {
>  	status =3D "okay";
>  	gpio-line-names =3D
> -	/*A0-A3*/       "status-locatorled-n",                    "",          =
            "button-nmi-n",          "",
> -	/*A4-A7*/       "",                                       "",          =
            "",                      "",
> -	/*B0-B3*/       "input-bios-post-cmplt-n",                "",          =
            "",                      "",
> -	/*B4-B7*/       "",                                       "",          =
            "",                      "",
> -	/*C0-C3*/       "",                                       "",          =
            "",                      "",
> -	/*C4-C7*/       "",                                       "",          =
            "control-locatorbutton", "",
> -	/*D0-D3*/       "button-power",                           "control-powe=
r",         "button-reset",          "control-reset",
> -	/*D4-D7*/       "",                                       "",          =
            "",                      "",
> -	/*E0-E3*/       "",                                       "",          =
            "",                      "",
> -	/*E4-E7*/       "",                                       "",          =
            "",                      "",
> -	/*F0-F3*/       "",                                       "",          =
            "",                      "",
> -	/*F4-F7*/       "",                                       "",          =
            "",                      "",
> -	/*G0-G3*/       "output-rtc-battery-voltage-read-enable", "input-id0", =
            "input-id1",             "input-id2",
> -	/*G4-G7*/       "input-alert1-n",                         "input-alert2=
-n",        "input-alert3-n",        "",
> -	/*H0-H3*/       "",                                       "",          =
            "",                      "",
> -	/*H4-H7*/       "input-mfg",                              "",          =
            "led-heartbeat-n",       "input-caseopen",
> -	/*I0-I3*/       "",                                       "",          =
            "",                      "",
> -	/*I4-I7*/       "",                                       "",          =
            "",                      "",
> -	/*J0-J3*/       "output-bmc-ready",                       "",          =
            "",                      "",
> -	/*J4-J7*/       "",                                       "",          =
            "",                      "",
> -	/*K0-K3*/       "",                                       "",          =
            "",                      "",
> -	/*K4-K7*/       "",                                       "",          =
            "",                      "",
> -	/*L0-L3*/       "",                                       "",          =
            "",                      "",
> -	/*L4-L7*/       "",                                       "",          =
            "",                      "",
> -	/*M0-M3*/       "",                                       "",          =
            "",                      "",
> -	/*M4-M7*/       "",                                       "",          =
            "",                      "",
> -	/*N0-N3*/       "",                                       "",          =
            "",                      "",
> -	/*N4-N7*/       "",                                       "",          =
            "",                      "",
> -	/*O0-O3*/       "",                                       "",          =
            "",                      "",
> -	/*O4-O7*/       "",                                       "",          =
            "",                      "",
> -	/*P0-P3*/       "",                                       "",          =
            "",                      "",
> -	/*P4-P7*/       "",                                       "",          =
            "",                      "",
> -	/*Q0-Q3*/       "",                                       "",          =
            "",                      "",
> -	/*Q4-Q7*/       "",                                       "",          =
            "",                      "",
> -	/*R0-R3*/       "",                                       "",          =
            "",                      "",
> -	/*R4-R7*/       "",                                       "",          =
            "",                      "",
> -	/*S0-S3*/       "input-bmc-pchhot-n",                     "",          =
            "",                      "",
> -	/*S4-S7*/       "",                                       "",          =
            "",                      "",
> -	/*T0-T3*/       "",                                       "",          =
            "",                      "",
> -	/*T4-T7*/       "",                                       "",          =
            "",                      "",
> -	/*U0-U3*/       "",                                       "",          =
            "",                      "",
> -	/*U4-U7*/       "",                                       "",          =
            "",                      "",
> -	/*V0-V3*/       "",                                       "",          =
            "",                      "",
> -	/*V4-V7*/       "",                                       "",          =
            "",                      "",
> -	/*W0-W3*/       "",                                       "",          =
            "",                      "",
> -	/*W4-W7*/       "",                                       "",          =
            "",                      "",
> -	/*X0-X3*/       "",                                       "",          =
            "",                      "",
> -	/*X4-X7*/       "",                                       "",          =
            "",                      "",
> -	/*Y0-Y3*/       "",                                       "",          =
            "",                      "",
> -	/*Y4-Y7*/       "",                                       "",          =
            "",                      "",
> -	/*Z0-Z3*/       "",                                       "",          =
            "led-fault-n",           "output-bmc-throttle-n",
> -	/*Z4-Z7*/       "",                                       "",          =
            "",                      "",
> -	/*AA0-AA3*/     "input-cpu1-thermtrip-latch-n",           "",          =
            "input-cpu1-prochot-n",  "",
> -	/*AA4-AC7*/     "",                                       "",          =
            "",                      "",
> -	/*AB0-AB3*/     "",                                       "",          =
            "",                      "",
> -	/*AB4-AC7*/     "",                                       "",          =
            "",                      "",
> -	/*AC0-AC3*/     "",                                       "",          =
            "",                      "",
> -	/*AC4-AC7*/     "",                                       "",          =
            "",                      "";
> +	/*A0-A3*/       "input-locatorled-n",                     "",          =
            "",                        "",
> +	/*A4-A7*/       "",                                       "",          =
            "",                        "",
> +	/*B0-B3*/       "input-bios-post-cmplt-n",                "",          =
            "",                        "",
> +	/*B4-B7*/       "",                                       "",          =
            "",                        "",
> +	/*C0-C3*/       "",                                       "",          =
            "",                        "",
> +	/*C4-C7*/       "",                                       "",          =
            "control-locatorbutton-n", "",
> +	/*D0-D3*/       "button-power-n",                         "control-powe=
r-n",       "button-reset-n",          "control-reset-n",
> +	/*D4-D7*/       "",                                       "",          =
            "",                        "",
> +	/*E0-E3*/       "",                                       "",          =
            "",                        "",
> +	/*E4-E7*/       "",                                       "",          =
            "",                        "",
> +	/*F0-F3*/       "",                                       "",          =
            "",                        "",
> +	/*F4-F7*/       "",                                       "",          =
            "",                        "",
> +	/*G0-G3*/       "output-hwm-vbat-enable",                 "input-id0-n"=
,           "input-id1-n",             "input-id2-n",
> +	/*G4-G7*/       "input-aux-smb-alert-n",                  "",          =
            "input-psu-smb-alert-n",   "",
> +	/*H0-H3*/       "",                                       "",          =
            "",                        "",
> +	/*H4-H7*/       "input-mfg-mode-n",                       "",          =
            "led-heartbeat-n",         "input-case-open-n",
> +	/*I0-I3*/       "",                                       "",          =
            "",                        "",
> +	/*I4-I7*/       "",                                       "",          =
            "",                        "",
> +	/*J0-J3*/       "output-bmc-ready-n",                     "",          =
            "",                        "",
> +	/*J4-J7*/       "",                                       "",          =
            "",                        "",
> +	/*K0-K3*/       "",                                       "",          =
            "",                        "",
> +	/*K4-K7*/       "",                                       "",          =
            "",                        "",
> +	/*L0-L3*/       "",                                       "",          =
            "",                        "",
> +	/*L4-L7*/       "",                                       "",          =
            "",                        "",
> +	/*M0-M3*/       "",                                       "",          =
            "",                        "",
> +	/*M4-M7*/       "",                                       "",          =
            "",                        "",
> +	/*N0-N3*/       "",                                       "",          =
            "",                        "",
> +	/*N4-N7*/       "",                                       "",          =
            "",                        "",
> +	/*O0-O3*/       "",                                       "",          =
            "",                        "",
> +	/*O4-O7*/       "",                                       "",          =
            "",                        "",
> +	/*P0-P3*/       "",                                       "",          =
            "",                        "",
> +	/*P4-P7*/       "",                                       "",          =
            "",                        "",
> +	/*Q0-Q3*/       "",                                       "",          =
            "",                        "",
> +	/*Q4-Q7*/       "input-bmc-smb-present-n",                "",          =
            "",                        "input-pcie-wake-n",
> +	/*R0-R3*/       "",                                       "",          =
            "",                        "",
> +	/*R4-R7*/       "",                                       "",          =
            "",                        "",
> +	/*S0-S3*/       "input-bmc-pchhot-n",                     "",          =
            "",                        "",
> +	/*S4-S7*/       "",                                       "",          =
            "",                        "",
> +	/*T0-T3*/       "",                                       "",          =
            "",                        "",
> +	/*T4-T7*/       "",                                       "",          =
            "",                        "",
> +	/*U0-U3*/       "",                                       "",          =
            "",                        "",
> +	/*U4-U7*/       "",                                       "",          =
            "",                        "",
> +	/*V0-V3*/       "",                                       "",          =
            "",                        "",
> +	/*V4-V7*/       "",                                       "",          =
            "",                        "",
> +	/*W0-W3*/       "",                                       "",          =
            "",                        "",
> +	/*W4-W7*/       "",                                       "",          =
            "",                        "",
> +	/*X0-X3*/       "",                                       "",          =
            "",                        "",
> +	/*X4-X7*/       "",                                       "",          =
            "",                        "",
> +	/*Y0-Y3*/       "input-sleep-s3-n",                       "input-sleep-=
s5-n",      "",                        "",
> +	/*Y4-Y7*/       "",                                       "",          =
            "",                        "",
> +	/*Z0-Z3*/       "",                                       "",          =
            "led-fault-n",             "output-bmc-throttle-n",
> +	/*Z4-Z7*/       "",                                       "",          =
            "",                        "",
> +	/*AA0-AA3*/     "input-cpu1-thermtrip-latch-n",           "",          =
            "input-cpu1-prochot-n",    "",
> +	/*AA4-AC7*/     "",                                       "",          =
            "",                        "",
> +	/*AB0-AB3*/     "",                                       "input-power-=
good",      "",                        "",
> +	/*AB4-AC7*/     "",                                       "",          =
            "",                        "",
> +	/*AC0-AC3*/     "",                                       "",          =
            "",                        "",
> +	/*AC4-AC7*/     "",                                       "",          =
            "",                        "";
>  };
> =20

I'd like some discussion in the commit message of whether these names
align with net names in the schematic, follow the OpenBMC GPIO naming
guidelines, or use some other strategy entirely.

Also, the columnisation of the names leads to more warnings from
checkpatch (due to line length). Other Aspeed-based devicetrees tend
not to make the whitespace so significant, and generally group the
GPIOs by complete banks. I prefer that the X570D4U devicetree is
consistent with the others.

Andrew
