Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5CF515E
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 17:43:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478mLC3cGBzF3Hq
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Nov 2019 03:43:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0ZpsztU1"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478mKZ4dh2zDrF2
 for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Nov 2019 03:42:57 +1100 (AEDT)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44B1F206A3;
 Fri,  8 Nov 2019 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573231375;
 bh=g4CoKvF3KBeAiTVPLjlckAUsjTuuIjtO+HohvgouYnY=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=0ZpsztU1FYRY6L52Ezgj7+jOOs1x/hVT/ozS92H5H+GQTKKKDb+rMwk7lVULhGsF/
 dGkdS59Ii91Y5vgj+xTa/pyKyS5XkSwV6lSpK4251lQ1R6b0j49oYgNTuw3uUfeI3I
 WaQv+j6fKwqgsZhzEUdOkSDt+Np7ZYDzDQDg98no=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACPK8Xe7dmeVjQYObzOw9LdwxH3+1XTcU+RJOZo5C69j8d-yOg@mail.gmail.com>
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-2-andrew@aj.id.au>
 <CACPK8XcGgGsoLNpCccKPb-5bojQS4c5BePewwocc-z29On7Rjg@mail.gmail.com>
 <20191107230029.75ED72178F@mail.kernel.org>
 <CACPK8Xe7dmeVjQYObzOw9LdwxH3+1XTcU+RJOZo5C69j8d-yOg@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
User-Agent: alot/0.8.1
Date: Fri, 08 Nov 2019 08:42:54 -0800
Message-Id: <20191108164255.44B1F206A3@mail.kernel.org>
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
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Joel Stanley (2019-11-08 03:29:41)
> On Thu, 7 Nov 2019 at 23:00, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Joel Stanley (2019-10-31 21:50:42)
> > > Hi clock maintainers,
> > >
> > > On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >
> > > > The AST2600 has an explicit gate for the RMII RCLK for each of the =
four
> > > > MACs.
> > > >
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >
> > > I needed this patch and the aspeed-clock.h one for the aspeed dts
> > > tree, so I've put them in a branch called "aspeed-clk-for-v5.5" and
> > > merged that into the aspeed tree. Could you merge that into the clock
> > > tree when you get to merging these ones?
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git/log/?=
h=3Daspeed-clk-for-v5.5
> > >
> >
> > Can you send a pull request please?
>=20
> Sure. Here you go. Let me know if you need it in a separate email.
>=20
> The following changes since commit d8d9ad83a497f78edd4016df0919a49628dcaf=
bc:
>=20
>   dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
> (2019-11-01 15:01:18 +1030)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> tags/aspeed-5.5-clk
>=20
> for you to fetch changes up to d8d9ad83a497f78edd4016df0919a49628dcafbc:
>=20
>   dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
> (2019-11-01 15:01:18 +1030)
>=20
> ----------------------------------------------------------------
> ASPEED clock device tree bindings for 5.5
>=20
> ----------------------------------------------------------------

The diffstat got lost? Anyway, thanks! I pulled it into clk-next.

