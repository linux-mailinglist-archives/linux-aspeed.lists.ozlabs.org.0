Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E8D9334
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 16:00:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tYqC6THJzDqZC
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 01:00:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="VTvgClYQ"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tYq00dNgzDqRD
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Oct 2019 01:00:42 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id h126so22806499qke.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqml278NTu5znyLj4o9Te22EdTDlURV2Qw1cIDtLTt4=;
 b=VTvgClYQ4A/Fh9y5c/hd9xtq28k1VhkkJC6Lae1lj1lS9CSeatI4xJUFt7aVOZWMpC
 c70NFA/b7hFsue6/wOXLILAIv1rMEqDmIBvWLgw6pEyTOArvK00uv3y2ezSbJfK//Mo4
 i5r/NkgWwB3lrYFwN5LcQ2tCGu8aeZgWrDRUWzHNOOQGwGamIoEpvEQqymVoEvVUbbPM
 BMHUwKj6KZhVgqPx3JZOk8L73cAWjLzEeo4NDhHQfPwLXBPLSaQKGY3a2evpL/0tLBHW
 9QGKALZPSodLHlZ5Ia7E3FjNomYdIpr+7Yb013hif8sY1MGNRGE4+poi7QzFf+5L98II
 qPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqml278NTu5znyLj4o9Te22EdTDlURV2Qw1cIDtLTt4=;
 b=o85fNq8Y3Ar+4G3XtlRLJdKpnI7+SDrUO2DdqiLBe0Jq2BdG1TvNSo5VtOWnnWLwNZ
 f3ALCf/Y5Duzug3xUgvy5YdsFP3TKpHCWRDqSJgdwMFPpgItk+MKVleySKyu0tk4husr
 mDvjJFdiHrk6cH3WjpPvLPLiKarvjXKpFtCHIKCBw2FEtT4gOWBddakd3QY8wdqwWXt8
 78EhGhgyaowLG4c36ZeB22TalloM0uN2aY/s+/jRfWHUbogSiWMyQJM9wU0MYxrNzzwd
 +fRtEQssqIUsJaKgf26so8mwQu4P8IH9NVln41JPC8gdguEt/59jp/kBCHX2aIfzqLwm
 QO+w==
X-Gm-Message-State: APjAAAW8TOImgnZ3gAHaNdbvcPRCEM/NodPZJRUb8jbYBwxAYVtkO/Io
 SNzTq7sLalUFgwMOVZSEiXAS+40TRmBpO34cqEXkFA==
X-Google-Smtp-Source: APXvYqxE/W8Wym2zPEoThfzgBl+Y8q8y0M/tZiDg5SGuXU2OGToGJCLrZSvaS15buTSq1qqdW86Kkg/8vbhVY6QMYW4=
X-Received: by 2002:a05:620a:34b:: with SMTP id
 t11mr38547340qkm.213.1571234438671; 
 Wed, 16 Oct 2019 07:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191008044153.12734-1-andrew@aj.id.au>
 <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
 <2de90789-c374-4821-89f9-5d5f01e7d2d6@www.fastmail.com>
In-Reply-To: <2de90789-c374-4821-89f9-5d5f01e7d2d6@www.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2019 16:00:26 +0200
Message-ID: <CACRpkdbmbyNmW8tL_L0agBajomPybXsjn9ix_F5-B3fZnfuW9A@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 16, 2019 at 1:42 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> I was hoping to get them into the 5.4 fixes branch: I consider them all fixes

OK I moved them all to fixes.

> > I need a shortlist of anything that should go into v5.4 if anything.
>
> IMO all of them should go into 5.4, as above.

OK

>  It's there something I can do in the future to communicate this better?

Nah it is a complicated process, things need to be done manually
at times, overly obsessing with process is counterproductive.

Yours,
Linus Walleij
