Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2285783E7
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jul 2022 15:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmjkQ0wbSz3bd6
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jul 2022 23:39:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmjkG6KpHz2yjC
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Jul 2022 23:39:33 +1000 (AEST)
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MhUHt-1naGSh46df-00egas for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Jul
 2022 15:39:29 +0200
Received: by mail-yb1-f170.google.com with SMTP id c131so20092904ybf.9
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Jul 2022 06:39:28 -0700 (PDT)
X-Gm-Message-State: AJIora/PRl8BZrskPXEERcxmqmFseAoQG/X5OPVcImtYFT73nbchjiOo
	ZfqQA0kumAOJqybwO4wrq4gjtk0p7bkSbImE1Yw=
X-Google-Smtp-Source: AGRyM1txCh5KSHFufIxKnjrUsQfdXMF5DhA1iW62NG52SJqnf8FXUR7Q6wJLhAzG6EEmYmN/Lvx4Nc0/ujPqwaXi97Q=
X-Received: by 2002:a81:1914:0:b0:31c:e12a:f33a with SMTP id
 20-20020a811914000000b0031ce12af33amr29924965ywz.209.1658144567116; Mon, 18
 Jul 2022 04:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220623072428.33697-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623072428.33697-1-krzysztof.kozlowski@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 13:42:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ob26oEL=af0KpyCqA4nxHW_PaaK3azKT504Q+VrFctA@mail.gmail.com>
Message-ID: <CAK8P3a0ob26oEL=af0KpyCqA4nxHW_PaaK3azKT504Q+VrFctA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: centriq2400: drop the board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7wLQo140PbBtE6vrEPbK1OKZu5V8WXN9Aiy8jn3sreoDWhQaCmL
 DbqyhgfbOV5upmnp3qsgpPr5I+8CN7b1xz2akbB+TMhQUefz0cTJRkGroxEWlEB2Mqm9Hx2
 2NynDSorfWKTmbNXBQDloLvrwWqorfYel5tgPhebO1u0rmd35fbh2LpGA4FiJrXpfvgZrhT
 syw8tENTGQKB+KpM4Psig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e8h6ygBObPo=:qV+tmqVILz52AH2SM+Xs5r
 cFMji4rsN+AoYkqB4ItgXedbiVC3eHVpqABc6Ynexuq9TzpV/1Q36RN1Zfy+jdBWEuUZF7BFP
 OtCMKcWNSALnSMpiy1qh18xim3o5hs3EvHJ2PW4oMP3Fk6PARWNonimPen5NejLREnJ9UKKbq
 3Z+Fmi6P18WyIKdQkoIPVVP/ImTuCPpcdm+cFZBRZ8KfxxwDh0Hi4jyZCNgNTTojhlWvTFIvc
 FUofUnlubS/cv+li5EMl6/wLMUbgIc+bppyIL2WVBbQCFJQmxM9xvvDw6/hNNq7Boecnyi+n6
 RqalhtfPhoITtVmqnXnflhhToQJ7EJRCZDYjEkxwSvYqR2E0Iwgl0e6dSLJcVRqWhbTMFlYNp
 r6KvSGKgYPrC9Haf+wcn+Ek32GJrU/3S3ghFiHifo5e69Zr6IcXRAMBii46pIDsh8hd1Zr/6v
 sw4cD2xqNzMLFtGuul+7TgaQOc+ZxGryq9dHUrbHJL3j3UZB2d9JzwBu9jKHGDSe879NFW0eK
 pyfAv7/ZJ7z4l7XHtLMhDKoa1fkbWYf78RUGAF+aris3wXW9mNXNwEPygTY2/iGwVXOzdZtPP
 y6b0ZRZ7bfPypPP76cuW7a1pAIlSx9+u67Eq+5bnfqXVO2hI50JGHo8c4f9NAG7mL57UsrXCf
 4VGQOdALG6NveoMhvRNKJIgpeGNM6TlkZCClrORiqxaydo7zxg0zj1aWKjBi5utm2VBOTHlEB
 UQbW1FW+Q1LUnfTEqTo/tePByw6dIglFYJm2QDUZ6t6Rc2bApfiUmO5ShuqWkp+5o6PLp1Znd
 lDp6rkR8o1sgl0O3fiLtWMqXZYgmf2j4s7rH/ULDTxXL9s9XfcFuDfz3gUHIqndWEOZPBtJEi
 nxAaZu1VABD6Xv65TLVPKgQqXFCOTNYGq4wSw1cWM=
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
Cc: DTML <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 23, 2022 at 9:24 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The board is unmaintained and unused, according to Joel, so simply let's
> remove it.
>
> Link: https://lore.kernel.org/all/CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 -
>  .../dts/aspeed-bmc-arm-centriq2400-rep.dts    | 225 ------------------

I found this one in my patchwork backlog. I had expected Joel it pick it up, but
it's not in linux-next yet.

Joel, should I just apply it for 5.20 or do you want to send me a pull
request with
this included?

         Arnd
