Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82544C62B4
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 06:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6V0S6Vvlz3bWM
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 16:52:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QJqrOXmn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QJqrOXmn; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6V0K1Sl6z2xrm
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 16:52:49 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id v3so8065674qta.11
 for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Feb 2022 21:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LrukX6XuAExN6DS+A748ipHnszpJnU5/xeoTyFh+5FE=;
 b=QJqrOXmnnt8dXzx3vbEr4LllK2vm/4kchgsHqIbiK+j1GJo5lrBO2LlN8g8EMMLdbC
 GhZnXmt4F+BDB3/xJblkL7YLy1zUjkFwPI7dAkCMsqV/zNodjs2/33gTeO9StYB4y2qB
 Bxd0UhV0qlZ+YNLtUfUw6U01hGPDCPqHuy1xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LrukX6XuAExN6DS+A748ipHnszpJnU5/xeoTyFh+5FE=;
 b=dWm7JXQUsXAyeX+RfE3JDbQFs29l3wMhduBfOVrPfhyVpRhjxlN02KloL+dmtTs1EL
 lZZ02ZppZe3Osk2QuM8cBdQkCuXMXQ3dD59AzNz3b2bjUNUzHv5vxMi9xpRXRU07TdOO
 szJdMTcSKtRYVqgH8CMXC/Q5f92ijmiRIZs8o0VwH6sTnIVpzCzR/bSqkagGAhJZlhWp
 AF25t2yq9yus/EFIaS+LULhWKEOHjer6blO0LfFZIFCkWrVyjtnjbWdjmbfivUqWPCYa
 urkRIZFYDraFWW9NkndiS7TEofdyxvD87peclSHDVyYxNbAbrQMCDZdRKn8dSOnjF/rz
 rmOQ==
X-Gm-Message-State: AOAM531NZbXb0NrI0D2Ks8xF/9TROgh5z6wnJ+fNQkI8+prW+If6lLZq
 yAK9H1MwAfbTH1etyDLjJo9S1M/57RjUaURYbow=
X-Google-Smtp-Source: ABdhPJzslGO3+BoncCaVwGhHKRxKEWa0ZEfksh/00spANaq9+RgKHbYr3XP8TDb7VmoNC7+qm++bxxZrvKJ2jM7MCJc=
X-Received: by 2002:ac8:5d89:0:b0:2df:f357:c681 with SMTP id
 d9-20020ac85d89000000b002dff357c681mr8622008qtx.475.1646027566328; Sun, 27
 Feb 2022 21:52:46 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
 <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 05:52:34 +0000
Message-ID: <CACPK8XcxuoF8U0ruwBakTLKxXzfW66tL7taK=y011LxSE1=uSg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.18
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 25 Feb 2022 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Feb 21, 2022 at 9:57 AM Joel Stanley <joel@jms.id.au> wrote:
> > ----------------------------------------------------------------
> > ASPEED device tree updates for 5.18
> >
> >  - New machines
> >
> >   * Quanta S6Q AST2600 BMC
> >   * Facebook's Bletchley is not new, but has a large update
> >
> >  - Small clenaups and additions for Everest, Rainier and Tacoma, and th=
e
> >    flash layout
> >
> > ----------------------------------------------------------------
> > Jonathan Neusch=C3=A4fer (8):
> >       dt-bindings: arm/npcm: Add binding for global control registers (=
GCR)
> >       MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM arch=
itecture
> >       ARM: dts: wpcm450: Add global control registers (GCR) node
> >       ARM: dts: wpcm450: Add pinctrl and GPIO nodes
> >       ARM: dts: wpcm450: Add pin functions
> >       ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and button=
s
> >       ARM: dts: wpcm450: Add pinmux information to UART0
> >       MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki
>
> It looks like you tagged the wrong branch, these are the same contents
> as in the nuvoton branch, but the description is for aspeed.
>
> I assume you have the correct branch somewhere local, so please resend
> the fixed pull request

I did! The correct branch was pushed to korg, but I tagged the wrong
branch. My bad, I'll send a v2.
