Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED77CB63
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 20:01:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zLpJ1DyYzDqlg
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2019 04:01:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="IcLzpeJ+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zLp25Vk7zDqjL
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2019 04:01:14 +1000 (AEST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EB8C217D6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jul 2019 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564596071;
 bh=8nOFSWZySTyugJad0IhgHzCcqRmA1DQddnc5vZfLDYQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IcLzpeJ++zT1SdS0YqxWYIhVWN/Np6xGXLCvPVp+qZEAwyVzAEfzWwNTCjCc+aaHe
 CXhmhBwiGSl0GrHglJzl85gRAaUrEdgMNFBm7VLNmotfl+5dExm7sddpL8W/1kAhQd
 oiWV2PBRcO9zD40ndRE3FX+3BDlpK1Dl0VDboG+w=
Received: by mail-qk1-f178.google.com with SMTP id d79so49862694qke.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jul 2019 11:01:11 -0700 (PDT)
X-Gm-Message-State: APjAAAU3SG8blB4r2hqrBdjNKK67MMlexV4VyeV41LpOxu4yfxXdNOof
 6OwHrAGx2ecVdA+ucYYHNNBF3zVCgfZixCDr0Q==
X-Google-Smtp-Source: APXvYqyh0H1hWwgJHkwCQ5+lJzOC3u4rhsBJaDX6WnQnTqxZqhR3SatK4t4orcp+Ov221H8C92iSLGnRywlqsL+eXQQ=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr17139303qke.393.1564596070704; 
 Wed, 31 Jul 2019 11:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190731053959.16293-1-andrew@aj.id.au>
 <20190731053959.16293-2-andrew@aj.id.au>
In-Reply-To: <20190731053959.16293-2-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 31 Jul 2019 12:00:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLu2M7qnO08kHbgheNCN1+Lis0shrjfnphMbkSJKRs7=A@mail.gmail.com>
Message-ID: <CAL_JsqLu2M7qnO08kHbgheNCN1+Lis0shrjfnphMbkSJKRs7=A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/4] dt-bindings: net: Add aspeed,
 ast2600-mdio binding
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 11:39 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 splits out the MDIO bus controller from the MAC into its own
> IP block and rearranges the register layout. Add a new binding to
> describe the new hardware.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v2:
> * aspeed: Utilise mdio.yaml
> * aspeed: Drop status from example
> ---
>  .../bindings/net/aspeed,ast2600-mdio.yaml     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
