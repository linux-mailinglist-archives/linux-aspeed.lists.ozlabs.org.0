Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E411C4C483C
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Feb 2022 16:02:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4tKs1RKmz3bb4
	for <lists+linux-aspeed@lfdr.de>; Sat, 26 Feb 2022 02:02:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Sat, 26 Feb 2022 02:02:17 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4tKj3ZVcz30Bc
 for <linux-aspeed@lists.ozlabs.org>; Sat, 26 Feb 2022 02:02:16 +1100 (AEDT)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlsWZ-1o6GJu0smh-00j3Vr for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Feb
 2022 15:57:05 +0100
Received: by mail-wr1-f52.google.com with SMTP id p9so4892885wra.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Feb 2022 06:57:04 -0800 (PST)
X-Gm-Message-State: AOAM532e+aqVpdnE4Xqh9ait+s1omJyxH2ReOH0HvCtXbHnBvbCdZPg5
 qNue6Quqkxj5+paOLIs23B5Xcb8lgoNVp2lXmJI=
X-Google-Smtp-Source: ABdhPJxs/UBnuO14LHbRouIs21YkqnbZNCCxHjPVMtCICEgTlGkU6axtUINGNfvp5WkcqXNuhm8URJhevkoTEnCviq8=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr6413403wrr.192.1645801024500; Fri, 25
 Feb 2022 06:57:04 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
In-Reply-To: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 15:56:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
Message-ID: <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.18
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:buadaxTn2yRIV2iJxTvUP/WtwKQ5q6NDQAy7hclIWROHg5UfL7D
 CjWdE2A49S5ELQTXTgQkgHT5/5/CgSnH3unpGBsDWviTAGmh1tPVUxuvMVGMejcq49L7o8D
 UR8SZl+p/OpoRzG/5RsEA+8KhBbk04wq5go+trzRH17ZaUPPfx//zfTqmwjbMYpmKswpEE4
 ATfLfN80Q64F6ImXEgRyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5TLAoBU+Fhk=:mA4HfRF3GGzC0E14QWllKW
 ncA5x4TUJB7YYfTWdmPr4vSFG6c2KJALFkdVC4EBfhY9Uf0h0MTDku28/bmGATmLXEBh/WHpp
 7FUBlXepxjxE54G+Rtq0qS0gM3ZTONdj5jLV2Oq/C232Y7H2diRT8NPHBsSJoiW/DGGFjmmPT
 3BBJvcwho3Be5In9QhdPSzz6l+PaNeYyS2PmlLy6QTuTLJTQQZmWbNrtyXi1Na1fZUYkoeCYV
 BeLj6YWwxg03M+vwYeDey8cp9INHNm03VqFgjcc8y1pEoP/Fltp9CQvnWea87qY35DSU+YmMY
 M+1lwmJ1JcBYRmAUGvn1gV0XQOAZk8+kvQRfVuq/wuOVm0jApGkFg8Z2U4jNC5NqW/BhuWHuY
 Q7UxZjpcvD14Olh/s68WlG5A74rGnnHABv0iKQspSSSz9pwinM3CJnJVt302+yi2llaVj1NIT
 d+TUT1+rEinzsOfmY6LksAKTfRabIWwnuJEn8vsCqqpTV1bAZzJrKLQ3Ugu4je4XWm0cU8TjH
 c4UIkBvO1oYm2B9F9yktTJkDaT8VWmPX9mWbsju+v4SFTm3OKhdklu6di6Yfs/q0o8oagNJew
 Zp2apVd7FbVa1d41KBsPSJ8ze0OuBJDUQY6UgvIKA6U1bX6Cu4fgCATPnR//BJrEZ90i9qlr+
 6OmzRt3g2XdKynbbS1kpR1O193hgIEN+yf8d8ly6hPrHJFLrabva9kmW++zv15H+LZ9A=
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
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 21, 2022 at 9:57 AM Joel Stanley <joel@jms.id.au> wrote:
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.18
>
>  - New machines
>
>   * Quanta S6Q AST2600 BMC
>   * Facebook's Bletchley is not new, but has a large update
>
>  - Small clenaups and additions for Everest, Rainier and Tacoma, and the
>    flash layout
>
> ----------------------------------------------------------------
> Jonathan Neusch=C3=A4fer (8):
>       dt-bindings: arm/npcm: Add binding for global control registers (GC=
R)
>       MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM archit=
ecture
>       ARM: dts: wpcm450: Add global control registers (GCR) node
>       ARM: dts: wpcm450: Add pinctrl and GPIO nodes
>       ARM: dts: wpcm450: Add pin functions
>       ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
>       ARM: dts: wpcm450: Add pinmux information to UART0
>       MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki

It looks like you tagged the wrong branch, these are the same contents
as in the nuvoton branch, but the description is for aspeed.

I assume you have the correct branch somewhere local, so please resend
the fixed pull request

       Arnd
