Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB19265936
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 08:18:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnlv62xMgzDqkJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 16:18:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=GHEpjzBi; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnlkR0NjYzDqcW
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 16:11:10 +1000 (AEST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11FD92220F
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 06:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599804667;
 bh=R+WQCRWfq/LEeLL9EuGAFD+jyfSl/fjliRW9gC2u17M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GHEpjzBiGvtJ1QhOXg4nIsgN5ThSgM00QRJX4Cghvz7A274L7p71V6OwfaBrG1X7J
 uVyd/7XdH7fhiQhYyOM4eLfnabBhEQ8cFOqAAgpYBXbjJTV7NJ8+LYLGYdNvk7hHE1
 8odlxiTb6JWeOThhbKMIc1HFWyofHRtn3Q8u/1v8=
Received: by mail-ej1-f52.google.com with SMTP id z22so12191685ejl.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 23:11:06 -0700 (PDT)
X-Gm-Message-State: AOAM530GgmZ+FelZfYQnWRPwfLGvvzkc8B51bI6mb/3sBR8xRJKay8PO
 LYRryOwO6qGnwYLNj/QCE2+GTVUbkCNT/KKSQek=
X-Google-Smtp-Source: ABdhPJysqYkgvsUB5GiEswkRNNKILHjjgWCeXRVo+QHtk0WCjK+abRX2rEGDEoOCLg/z/tM8wvqyn+iTq0H6F2DGVuc=
X-Received: by 2002:a17:906:af53:: with SMTP id
 ly19mr495830ejb.503.1599804665477; 
 Thu, 10 Sep 2020 23:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-13-krzk@kernel.org>
 <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
In-Reply-To: <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:10:53 +0200
X-Gmail-Original-Message-ID: <CAJKOXPca3R=LYVws9rYj-iuOx7Z1GMkM2ow2pCQ3CGnv0vSS7Q@mail.gmail.com>
Message-ID: <CAJKOXPca3R=LYVws9rYj-iuOx7Z1GMkM2ow2pCQ3CGnv0vSS7Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ARM: dts: aspeed: align GPIO hog names with
 dtschema
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Sep 2020 16:18:38 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 02:58, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.
>
> This is a bit ugly. Do we have to go down this path?

No, but please comment on schema (1/15 in this series).

Best regards,
Krzysztof
