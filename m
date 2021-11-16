Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6ED452837
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 04:08:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtWGP6c9Yz2xtK
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 14:08:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HX+WlerY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HX+WlerY; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtWGH27Dbz2xDM
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 14:08:05 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id u16so12772718qvk.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Nov 2021 19:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+3tuhUNj0IibcDWormquB6v06wUV9mYHE56GduUS2M=;
 b=HX+WlerYmiz45dfnhbTRz6BP49luNrI3xPfvXAYTA5J893Cp1bgpgD2R5O7ilpXhW2
 Ztmg7mlqRhJkIkuQm++MMxicg1qvpkbTGvPIau+qkbupjPVIfVYoLwIHU9tvFf/5pFBG
 WgEPgLF0Bhivdt+M0+t9VJ0AkIctplBmfJFqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+3tuhUNj0IibcDWormquB6v06wUV9mYHE56GduUS2M=;
 b=RIGkW+18I47xSMszQWrMHQJwj5aTGTMxu/EPqx0LHprtay/TrRUVOUpI3efe6ktwKp
 1ZDbth+vcSyIs5NShhDnM3lx5QkulHh15nlzxOo3sqGYhpmoRzr95fRGblgYoiog6lrs
 IJ5p7aLmKlJ+GMxNeL45py+dXwahLB9vcKA2y1nfiDMqlAha8QlJV3kPO3+BgD+iymGD
 pdLGwy7tAv+Fh0TGU/VwL07yOD8tIkn4Jv8SmfDlf+0PPLcXUmESk5kd5hUfa3iw20Lm
 QnOO3SHGlYywXHWF/7bCbwdraYJK9hL/9FQlQjdn8fdmmwskQxLDqs68c6as4c8Cxgao
 8RXg==
X-Gm-Message-State: AOAM533UPQrixo+KzNSBr/0QrENdiXbyFCjqQ0gQZhJlONwRNGakrWPE
 rfZp8DnGnLXwSye7SAw605jfKMYym6oWek1qnUY=
X-Google-Smtp-Source: ABdhPJxVHar3OL/4LwNLEgzkuKc1H5RS71UlqygRtUVrY8OEkV+Kz3DE/kgpDDzrS8wn8JXdXAJ7KIukSIeqLNgOs0g=
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr42634802qvc.43.1637032080033; 
 Mon, 15 Nov 2021 19:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110062656.3041994-1-howard.chiu@quantatw.com>
In-Reply-To: <20211110062656.3041994-1-howard.chiu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 03:07:48 +0000
Message-ID: <CACPK8Xc6wV4KbMAT_ekyMTTbfNqx2ox_d7mEFGVT4OvBDDadBQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Howard Chiu <howard10703049@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Howard Chiu <howard.chiu@quantatw.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Howard,

On Wed, 10 Nov 2021 at 06:29, Howard Chiu <howard10703049@gmail.com> wrote:
>
> Initial introduction of Facebook Bletchley equipped with
> Aspeed 2600 BMC SoC.
>
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> ---

Please use this area to document the differences between versions of
your patch. Let us know what you've fixed, and what you've decided not
to change based on review.

> +&uart5 {
> +       // Workaround for A0
> +       compatible = "snps,dw-apb-uart";
> +};

Are you still using a0 boards?

> +
> +&i2c0 {
> +       status = "okay";
> +       /* TODO: Add HSC MP5023 */
> +       /* TODO: Add ADC INA230 */
> +
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +
> +       sled0_ioexp: pca9539@76 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x76>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","SLED0_BMC_CCG5_INT","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
> +               "SLED0_SSD_ALERT","SLED0_MS_DETECT","SLED0_MD_REF_PWM","",
> +               "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
> +               "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","SLED0_AC_PWR_EN";

I'll wait for Patrick's review on these. I would prefer you follow the
openbmc naming scheme that he mentioned in v1 of your patch.

> +
> +               gpio@0 {
> +                       reg = <0>;
> +               };

I think this is incorrect, you would need to specify:

type = <PCA955X_TYPE_GPIO>

However with this change, there's no need to specify the individual gpio nodes:

https://lore.kernel.org/all/20210921043936.468001-2-andrew@aj.id.au/


> +
> +&i2c4 {
> +       status = "okay";
> +       /* TODO: Add HSC MP5023 */
> +       /* TODO: Add ADC INA230 */
> +
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +
> +       sled4_ioexp: pca9539@76 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x76>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","SLED4_BMC_CCG5_INT","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
> +               "SLED4_SSD_ALERT","SLED4_MS_DETECT","SLED4_MD_REF_PWM","",
> +               "SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
> +               "SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","SLED4_AC_PWR_EN";

As Patrick mentioned, I think we want to have a convention for
multi-node machines in the GPIO naming.
