Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CA2D38A6
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Dec 2020 03:19:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrLMw4m5RzDqlW
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Dec 2020 13:19:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Prp5KC+l; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrLMr3G34zDqhD
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Dec 2020 13:19:20 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id h20so4440qkk.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Dec 2020 18:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7cZeETuOaHuzt2Vvd1AgHUQFc1tVzHtDBun/9sMNcHA=;
 b=Prp5KC+l5Qcfvh9IzzGs4P4XGezAoVWjjjvy04CNCPHOHidRwdQ3s9ercRfbsy0xSl
 gEWfsYhhjY6DjFdiLNVkakemH09BwdQ8lOkV9FKYAwu7OKhMBifOMG7qzursMSBEFbpo
 JSZ83Yl7PnpZwS1Xr6WGsCamZgGSHGnTA5wek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7cZeETuOaHuzt2Vvd1AgHUQFc1tVzHtDBun/9sMNcHA=;
 b=D0d390SanKz+ISt8Hqp0j7SHRdO9kNPJ2WXL73jdMK165NU25dUBlbQ/1rg6O5SQjn
 l0TLP+qMo42p/MTEbmXxYYwLMCmtT4XpQIgSPs/zf84EzNDlrKm7hmP2xTCr8jvGCiAL
 NUVe2XJJKZ1zacUwsHyr9JWjExdpWjlAX1d4g4JxV2A1+Xxt6iwDIcHWshwjKMTBw1kh
 JPKvLokBxgoPVrgIYRz/PGja6fKyYXISwlu9in9VzVKWMEjj40rErrFwhPwVf1GF7t7L
 fUAcxJQ4tJP3oL6W300nAeQrRxD7xAl1KE2/VnIa45X6tzOb7i3zVNRYKdrS/NHQGPXi
 thMg==
X-Gm-Message-State: AOAM531A5myVcwPJ1X59A8pubRoxMXSA+9Qag4UM7ijgRewaqBvEXRNH
 ECr2cD+vCqToHWFDhJW5XiS7bwuYzptTF9bKVio=
X-Google-Smtp-Source: ABdhPJyc6btv5VUv0Mqhezo+2CB3ZLlv01s1FeTPQ0wb3A3KL9BweIkDsU1kcqFzGjk8eV1sb9E3E6AN1rd0R41KEbY=
X-Received: by 2002:a37:490a:: with SMTP id w10mr266374qka.487.1607480356757; 
 Tue, 08 Dec 2020 18:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20201208043700.23098-1-quan@os.amperecomputing.com>
 <20201208043700.23098-3-quan@os.amperecomputing.com>
 <CACPK8XdsbgKKr=icLxV=PZB9U03ZGWXQwCWgFvoqgCj9K_fbVg@mail.gmail.com>
 <CAJKOXPc2wY+tcXpZRkdKodr+SgQSbW=+qWYU6E1t8CXE0D9iNA@mail.gmail.com>
In-Reply-To: <CAJKOXPc2wY+tcXpZRkdKodr+SgQSbW=+qWYU6E1t8CXE0D9iNA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Dec 2020 02:19:04 +0000
Message-ID: <CACPK8Xc0pq3GW91+E4CwA8PSnF8=ouf6EpikMk3OaEwRh_88DQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jade BMC
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, allen <allen.chen@ite.com.tw>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 at 08:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, 8 Dec 2020 at 05:42, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, 8 Dec 2020 at 04:37, Quan Nguyen <quan@os.amperecomputing.com> wrote:
> > >
> > > The Mt. Jade BMC is an ASPEED AST2500-based BMC for the Mt. Jade
> > > hardware reference platform with Ampere's Altra Processor Family.
> > >
> > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > > Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> > > Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> >
> > Thanks, I've applied this to the aspeed tree.
>
> Did you review it already before (which would explain tags being there)?

Correct, these were sent to the openbmc list initially:

 https://lore.kernel.org/openbmc/CACPK8XdabEgp2Qi0Ud0BJ9oCK2BJ6L-F2Wg+OOEvzTALRLDadg@mail.gmail.com/

Cheers,

Joel
