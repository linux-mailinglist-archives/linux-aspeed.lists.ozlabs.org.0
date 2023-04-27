Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF836F020C
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Apr 2023 09:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6SVz4Tklz3f3x
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Apr 2023 17:47:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6SVt1PXLz3c6v;
	Thu, 27 Apr 2023 17:47:01 +1000 (AEST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54fb89e1666so63621157b3.3;
        Thu, 27 Apr 2023 00:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682581617; x=1685173617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEqTvNM+jsZjZI+7JGQt1mFWY94TcOH6GPmA2DQxr8s=;
        b=jTfKItYuruuOGpcQ9vF3hUinhZC/mP+06IJ+x/3x/UJ1j+sPLzm/gXHsFds1is/0x2
         lChwX98UWQsvJDdKZfMTwAK7w/u/nLemP/GqAgs3u8R/ovZqmRQ5NsRUGxMS4CLphBwO
         gs8B4nLhKDU13MkRc6odKHkVQekBnwjgqNQSBZPZ/7d07xMM1m6L8WDob9flPWCCoxka
         3MHtWjvWwzOs7lKcQ9UDH/yLhlQiXrwwWqodCc4jUNPPg1rmTzwcClBs6CD+EtaPCp7M
         0CFTrEGN40DcDbw8hGkzsb+fAjH7+9aVgcUwJDuwxuZM1473kY4RVM0ue9qoMmUvBDX0
         FTdA==
X-Gm-Message-State: AC+VfDxWBlwbAQVY3Iqc6cIoojmcw9MpdNNLjiMHKrcEoXp1ECLrGCFO
	tfXVIiXg009wSNrrLk5+kXtKPDrN5HtKtQ==
X-Google-Smtp-Source: ACHHUZ7LIQLUnyHKpopQ0bZ8H2BspC5xnI5fzaEWxqrLbb/iNuPKAESWCSY1PfJQX5pss+9SIm8D5Q==
X-Received: by 2002:a81:6c82:0:b0:54f:47a:c2f with SMTP id h124-20020a816c82000000b0054f047a0c2fmr587763ywc.3.1682581617478;
        Thu, 27 Apr 2023 00:46:57 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id z128-20020a818986000000b005460251b0d9sm4661315ywf.82.2023.04.27.00.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54fb89e1666so63620967b3.3;
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: by 2002:a0d:d712:0:b0:54e:ed46:6b39 with SMTP id
 z18-20020a0dd712000000b0054eed466b39mr582224ywd.31.1682581616022; Thu, 27 Apr
 2023 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com> <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
In-Reply-To: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2023 09:46:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>, linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 27, 2023 at 9:37=E2=80=AFAM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
> On 25/04/2023 17:57, Rob Herring wrote:
> > On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.o=
rg> wrote:
> >>> I have a script[1] that does the conversion written the last time thi=
s
> >>> came up. Just have to agree on directory names. I think the easiest
> >>> would be for Arnd/Olof to run it at the end of a merge window before
> >>> rc1.
> >>
> >> "emev2" and "sh7" are missing for renesas.
> >
> > No doubt it's been bitrotting (or I may have missed some).
> >
> >> Does your script also cater for .dts files not matching any pattern,
> >> but including a .dtsi file that does match a pattern?
> >
> > I assume I built everything after moving, but maybe not...
> >
> > That's all just "details". First, we need agreement on a) moving
> > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > been stuck on a) for being 'too much churn'.
> >
>
> I think it makes sense to move them and probably the best way to do so is=
, as
> you proposed: that Arnd or Olof run the script to move them just before -=
rc1

FTR, no objections from my side.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
