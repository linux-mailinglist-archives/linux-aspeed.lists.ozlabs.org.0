Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9592D2567
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 09:09:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqt9w41yBzDqWS
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 19:09:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cpzu6RDt; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cqt9n1qmFzDqWN
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 19:09:01 +1100 (AEDT)
X-Gm-Message-State: AOAM531FATHYncg3fwRE/tfgpB+SuwvF+gVhAZz7IOnW0i/aOHbv/47A
 E4dUjlmUJ8Los9i5/XMcWORwPw3AweEhjnBTQfc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607414938;
 bh=LhPpJxC4F5Q3Y/fX73/+10L00v+eOApqEJLmH8dkajo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cpzu6RDtnB0yEkEvK7aYyfX1tX24iW65gKao2x8SM/84+WA1x0BAwUXuqCcnVbv+e
 PeUt37/U84dLpYuRmZNeWe6ZwPEDOygOGBiWyHexzkBOu8QK+YdC4kuFyP9Hlo+B0c
 N3hqLr1B8i3Pe1K3CGNcOSf75SsflNb9SRY79KVhR2BX6kPR5QRP5ynOGZ8Qh/O7xX
 qhqsqNu2wXsuHr5CskyKAcQbUiRx35S5KDc/z83jqdoiDPAq1kbyU9IO9uE5RQqImf
 Hp2jvkBe+9Mt0gVlmb7NKwtlX3kJCbYsZlwMi1VOkTord1YXXvTbh4GV+skabNq9zR
 fZYZKwLJdw+Bw==
X-Google-Smtp-Source: ABdhPJwe1x41l8I7WarLwBmKZ2PsxA0cxVWQLgoGcW+CucDX3vRQbuP0kctQJUR/b8oR9+p75TThDyXXV7jUAio3k2g=
X-Received: by 2002:aa7:d593:: with SMTP id r19mr24099686edq.246.1607414937105; 
 Tue, 08 Dec 2020 00:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20201208043700.23098-1-quan@os.amperecomputing.com>
 <20201208043700.23098-3-quan@os.amperecomputing.com>
 <CACPK8XdsbgKKr=icLxV=PZB9U03ZGWXQwCWgFvoqgCj9K_fbVg@mail.gmail.com>
In-Reply-To: <CACPK8XdsbgKKr=icLxV=PZB9U03ZGWXQwCWgFvoqgCj9K_fbVg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 8 Dec 2020 09:08:45 +0100
X-Gmail-Original-Message-ID: <CAJKOXPc2wY+tcXpZRkdKodr+SgQSbW=+qWYU6E1t8CXE0D9iNA@mail.gmail.com>
Message-ID: <CAJKOXPc2wY+tcXpZRkdKodr+SgQSbW=+qWYU6E1t8CXE0D9iNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jade BMC
To: Joel Stanley <joel@jms.id.au>
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

On Tue, 8 Dec 2020 at 05:42, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 8 Dec 2020 at 04:37, Quan Nguyen <quan@os.amperecomputing.com> wrote:
> >
> > The Mt. Jade BMC is an ASPEED AST2500-based BMC for the Mt. Jade
> > hardware reference platform with Ampere's Altra Processor Family.
> >
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> > Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
>
> Thanks, I've applied this to the aspeed tree.

Did you review it already before (which would explain tags being there)?

Best regards,
Krzysztof
