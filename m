Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD34ED379
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 07:50:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTXTM1MCRz2yYY
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 16:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QONXwZBY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QONXwZBY; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTXTG4x09z2xTd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 16:50:25 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id kd21so16069400qvb.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 22:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2oBpHtrBdpM0TGFuOASxC4p1tI7RPpF06aJ0LQ4yyNY=;
 b=QONXwZBYl68by23h+aqXxcvVrpAmyM13ha2EKDpwQPkRvt5bIFsl6+t7jzFrbFe3FF
 bqEkvNqd3PyKCNIvQajvODv6hZ6HwtIPhLxP2kD23ichzQkNpvB4s4mkL+VHFIVojsZL
 hch26KOlqKQ1O3DkETMoNhQ1Zb/cH8hCSgWa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2oBpHtrBdpM0TGFuOASxC4p1tI7RPpF06aJ0LQ4yyNY=;
 b=FVqsMOte2PipTpFiUUyVeN+IP+qBehYCw+0Q+tqXEaqb/ALdBgj2iN7WMjHtBiOK8E
 MLP5bYfdKNQm9Mwow97w1BjHirFuC83qMBXykSgyFh6wkHvviL6qNE3+aJqoZsc7klIU
 07h/0mWhMYcOAP8Vn3JwHFcswLlNBFZ+zh37WyuAyfTPS/JjkiWrZ3PbAklCwnqbruzF
 ozFi3CI7gqvYdHtuHpEuvAlNv98j5uK57aOPQuQxjzm9iExnjl6JV4gtyk9VzvdVxc5B
 LFfBSuoCrNR/4NJb63l1FsUD0flU4U97dEUPbF9xgQAQrrbW/cKcnkLzUsO6zy0lcMTI
 aejw==
X-Gm-Message-State: AOAM531KoLFoAf4YxwlIqNy14fzsPvmNUxe9lFGZZ2qCOrpn1/HkIBxw
 UZ8wdC7gJkHxYpqnXPUJxeNV48nADC1yktCrbIE=
X-Google-Smtp-Source: ABdhPJy14y1rZ/Fa9UzlR9zIAvnQEzWiwJB0Dy2xlYMEZuCiIsR/C1QoNXpzjR5oLu+5kC5ushrdfnh1NkPe50mihYk=
X-Received: by 2002:a05:6214:c27:b0:441:1e99:4de3 with SMTP id
 a7-20020a0562140c2700b004411e994de3mr33853973qvd.49.1648705822234; Wed, 30
 Mar 2022 22:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 05:50:10 +0000
Message-ID: <CACPK8Xed5Kh_Y2B3NY41bjgoALvz1gC4zbNfmUaHn_8EbHio4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <quic_jiles@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 29 Mar 2022 at 17:40, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote=
:
>
> I=E2=80=99m sending this patch series to fix current issues in AST2600 pi=
nmux
> settings while enabling quad mode SPI support.
>
> FWSPI18 pins are basically 1.8v logic pins that are different from the
> dedicated FWSPI pins that provide 3.3v logic level, so FWSPI18 pins can=
=E2=80=99t
> be grouped with FWSPIDQ2 and FWSPIDQ3, so this series fix the issue.
>
> Also, fixes QSPI1 and QSPI2 function settings in AST2600 pinctrl dtsi to
> make it able to enable quad mode on SPI1 and SPI2 interfaces.
>
> With this series, quad mode pinmux can be set like below.
>
> FW SPI:
> &fmc {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_fwqspi_default>;
> }
>
> SPI1:
> &spi1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_qspi1_default>;
> }
>
> SPI2:
> &spi2 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_qspi2_default>;
> }

Thanks. I hope to see a board from you that uses this soon :)

I'll send the patches as fixes once -rc1 is out.

>
> Please review.
>
> Thanks,
> Jae
>
> Changes in v3:
>  * Added bindings patches. (Andrew)
>
> Changes in v2:
>  * Rebased it on the latest.
>
> Jae Hyun Yoo (5):
>   ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
>   pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
>   dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
>   dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
>   ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group
>
> Johnny Huang (2):
>   pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
>   ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi
>
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml         |  4 ++--
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi        | 10 +++++-----
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c      | 17 ++++++++---------
>  3 files changed, 15 insertions(+), 16 deletions(-)
>
> --
> 2.25.1
>
