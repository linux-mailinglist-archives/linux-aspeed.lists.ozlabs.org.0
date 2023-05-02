Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06D6F95A4
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 02:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDQSw5Z9rz3bl3
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 10:36:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RT0q3Tq/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=christianshewitt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RT0q3Tq/;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9vDF60n9z2x9L;
	Wed,  3 May 2023 08:01:15 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso43876725e9.2;
        Tue, 02 May 2023 15:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683064867; x=1685656867;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdcAdDdlf9uHq0BGWP12DCyO25DhnUOTFA60Cufr6eI=;
        b=RT0q3Tq/QobRc7VhWSA058nWN/Za5XYXvPGAIJlI1ZUNAUDMj5BN+lfBvNOL7lOsvi
         wsgGV7KrmVwWv/KMOdekp8C7pQaON1LAK5t9ubx19ePpGuEftKgJC/l7k+ML6sxx8JK9
         UlUulOSSkFQPIDL+zYjvJKrqSMzaiEy1GG+3oxDl6PSn1KoVPFpl6qS5BdSJSBjjC2b8
         bwX53rYuzNXwiPyy0bXgSp2J2HTLqVbctbilWo7XLgkDv9sLOmwJ//iCqRERemcfFjBs
         YRmeM+KtYqqC91FnNE0ka6uEtbetCHByeOTjm2Jt4RVi90NmQdapH1J4YBNcEwBPOh/O
         LYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683064867; x=1685656867;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdcAdDdlf9uHq0BGWP12DCyO25DhnUOTFA60Cufr6eI=;
        b=NxOiA39DejxZJclgLlvMOub7F1uf2hDzY02BJqiAADLA08yvJAxTo6aaWK7xVnZopZ
         ODOwn8RSDbRwst0AaXlNHDPKQu90Tsx12BsQ6j6p5BE3MZn3DB+0ltFdNrmlbaTxFwRm
         mk6WJhaG6HdR2W82uH7GOE/l6+b64zhJ5FYS/5wbIZRL6agdOrdL7H40ZrD00N9qJ1vs
         RgIM1H8EhKqO1ZDOEePbghNNQNgUIzf1qIWQuPa5CKlUY7ceB9FN3KtsmDFqEog2pMgw
         2IY0i7Ljn1vKRznfOoJ6Y2wAvEu26bDXt4TY7/S5p2I1Mtp7SkSYt3JjjTrZXCCpwXGf
         MNDw==
X-Gm-Message-State: AC+VfDwAj/LTviliEXh4xh46emr6K2bHLFChVdcm3gsORxCMN/XSS79S
	AXHFP35R/RomAD8MIW2wLg0=
X-Google-Smtp-Source: ACHHUZ5ybUYKWTDV7iyMT3UD1OcV6iuMEt21qUpy9BFWRJB0WpmP8MgHZQVEdSajDh7czeTwLAcS3Q==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:9ca1:cac3 with SMTP id z20-20020a7bc7d4000000b003f19ca1cac3mr13020245wmk.34.1683064867148;
        Tue, 02 May 2023 15:01:07 -0700 (PDT)
Received: from smtpclient.apple ([91.135.9.67])
        by smtp.gmail.com with ESMTPSA id y4-20020a05600c364400b003f175954e71sm1965wmq.32.2023.05.02.15.01.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 15:01:06 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Date: Tue, 2 May 2023 23:01:04 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-Mailman-Approved-At: Sun, 07 May 2023 10:35:52 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io
 >
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



> On 2 May 2023, at 8:40 pm, Rob Herring <robh+dt@kernel.org> wrote:
>=20
> On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>=20
>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven =
<geert@linux-m68k.org> wrote:
>>>=20
>>>> Does your script also cater for .dts files not matching any =
pattern,
>>>> but including a .dtsi file that does match a pattern?
>>>=20
>>> I assume I built everything after moving, but maybe not...
>>>=20
>>> That's all just "details". First, we need agreement on a) moving
>>> things to subdirs and b) doing it 1-by-1 or all at once. So far =
we've
>>> been stuck on a) for being 'too much churn'.
>>=20
>> Sorry for missing most of the discussion last week. The script sounds
>> fine to me, the only reason I didn't want to do this in the past is =
that
>> we had the plan to move platforms out of the kernel tree to an =
external
>> repository and I wanted to do this platform at a time and also only =
move
>> each one once. I don't think that is going to happen anytime soon =
now,
>> so let's just do your script.
>>=20
>> Can you send me the script and/or a pull request of the resulting
>> tree based on my soc/dt branch? Everything is merged upstream,
>> and I think git-merge would handle the remaining merges with any
>> other changes in mainline.
>=20
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
>=20
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
>=20
> Here's the current mapping:
>=20
> vendor_map =3D {
>    'alphascale' : 'alphascale',
>    'alpine' : 'alpine',
>    'artpec' : 'axis',
>    'axm' : 'lsi',
>    'cx9' : 'cnxt',
>    'ecx' : 'calxeda',
>    'highbank' : 'calxeda',
>    'ep7' : 'cirrus',
>    'mxs': 'mxs',
>    'imx23': 'mxs',
>    'imx28': 'mxs',
>    'sun' : 'allwinner',
>    'imx': 'imx',
>    'e6' : 'imx',
>    'e7' : 'imx',
>    'mba6' : 'imx',
>    'ls': 'fsl',
>    'vf': 'fsl',
>    'qcom': 'qcom',
>    'am3' : 'ti',
>    'am4' : 'ti',
>    'am5' : 'ti',
>    'dra' : 'ti',
>    'keystone' : 'ti',
>    'omap' : 'ti',
>    'compulab' : 'ti',
>    'logicpd' : 'ti',
>    'elpida' : 'ti',
>    'motorola' : 'ti',
>    'twl' : 'ti',
>    'da' : 'ti',
>    'dm' : 'ti',
>    'nspire' : 'nspire',
>    'armada' : 'marvell',
>    'dove' : 'marvell',
>    'kirkwood' : 'marvell',
>    'orion' : 'marvell',
>    'mvebu' : 'marvell',
>    'mmp' : 'marvell',
>    'berlin' : 'berlin',
>    'pxa2' : 'pxa',
>    'pxa3' : 'pxa',
>    'pxa' : 'marvell',
>    'arm-' : 'arm',
>    'integ' : 'arm',
>    'mps' : 'arm',
>    've' : 'arm',
>    'aspeed' : 'aspeed',
>    'ast2' : 'aspeed',
>    'facebook' : 'aspeed',
>    'ibm' : 'aspeed',
>    'openbmc' : 'aspeed',
>    'en7' : 'airoha',
>    'at91' : 'microchip',
>    'sama' : 'microchip',
>    'sam9' : 'microchip',
>    'usb_' : 'microchip',
>    'tny_' : 'microchip',
>    'mpa1600' : 'microchip',
>    'animeo_ip' : 'microchip',
>    'aks-cdu' : 'microchip',
>    'ethernut5' : 'microchip',
>    'evk-pro3' : 'microchip',
>    'pm9g45' : 'microchip',
>    'ge86' : 'microchip',
>    'bcm' : 'brcm',
>    'exynos' : 'samsung',
>    's3c' : 'samsung',
>    's5p' : 'samsung',
>    'gemini' : 'gemini',
>    'hi3' : 'hisilicon',
>    'hip' : 'hisilicon',
>    'hisi' : 'hisilicon',
>    'sd5' : 'hisilicon',
>    'hpe' : 'hpe',
>    'intel': 'intel',
>    'mt' : 'mediatek',
>    'meson' : 'meson',

=E2=80=98meson=E2=80=99 : =E2=80=98amlogic=E2=80=99,

^ to match the SoC vendor name (and arm64)

Christian

>    'moxa' : 'moxa',
>    'mstar' : 'mstar',
>    'nuvo' : 'nuvoton',
>    'lpc' : 'lpc',
>    'lan96' : 'microchip',
>    'owl' : 'actions',
>    'ox8' : 'oxsemi',
>    'rda' : 'rda',
>    'rtd' : 'realtek',
>    'r7' : 'renesas',
>    'r8' : 'renesas',
>    'r9' : 'renesas',
>    'emev2' : 'renesas',
>    'sh73a' : 'renesas',
>    'gr-' : 'renesas',
>    'iwg' : 'renesas',
>    'rk' : 'rockchip',
>    'rv11' : 'rockchip',
>    'rockchip' : 'rockchip',
>    'socfpga' : 'socfpga',
>    'stm' : 'stm32',
>    'sti' : 'sti',
>    'st-pin' : 'sti',
>    'ste' : 'st-ericsson',
>    'spear' : 'spear',
>    'axp' : 'allwinner',
>    'tegra' : 'nvidia',
>    'milbeaut' : 'socionext',
>    'uniph' : 'socionext',
>    'vt8500' : 'vt8500',
>    'wm8' : 'vt8500',
>    'xen' : 'xen',
>    'zx' : 'zte',
>    'zynq' : 'xilinx',
> }
>=20
> Rob
>=20
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git =
arm-dts-move-v2
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

