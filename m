Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9D8687D7
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 04:41:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mcpnKLv3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkNYp4Z8gz3d2m
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 14:41:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mcpnKLv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkNYf4hlSz3bnx
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 14:40:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B72E361488;
	Tue, 27 Feb 2024 03:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFDDC433C7;
	Tue, 27 Feb 2024 03:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709005250;
	bh=F7EpFyKjl+IHhn75vKorY4OI7se0+dD77WgdblI6/x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcpnKLv33h4/RDikiNfpNAwZoEGni5wy7RwuQuOUWYZ49SjyUiEHngtHF/Ie0byu3
	 zpsuIyUhjpkniZG2ThzQAmVfzuckmU25CMlnu07msCPm0xA5nxUqrzReC8yNd0vBld
	 huBTwoZQViD7rgdF2SEPq/mNYA/hNRvN10y8GM+M+etVEzSW0iA2W/1i9HQdFG2oI4
	 Q6xHXFfc+l5TTEYV6q1+uuKcbHLr89FQmlIVZn8+Va3Fb72zXHpAtWTIk6NseIFSLP
	 dY5fghMr+ashA33RN9xeGZNk6adadUcknmYMkKwXvbgtQTqPS4jGFq2UXtg0BaCJWq
	 Huol/qweALfYQ==
Date: Mon, 26 Feb 2024 21:40:47 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v4] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to DT
 schema
Message-ID: <20240227034047.GA2644802-robh@kernel.org>
References: <20240227004414.841391-1-andrew@codeconstruct.com.au>
 <170900020204.2360855.790404478830111761.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170900020204.2360855.790404478830111761.robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:16:43PM -0600, Rob Herring wrote:
> 
> On Tue, 27 Feb 2024 11:14:14 +1030, Andrew Jeffery wrote:
> > Squash warnings such as:
> > 
> > ```
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e600000/gpio@1e780000: failed to match any schema with compatible: ['aspeed,ast2400-gpio']
> > ```
> > 
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > v4: Add constraints for gpio-line-names, ngpios as requested by Krzysztof:
> >     https://lore.kernel.org/all/458becdb-fb1e-4808-87b6-3037ec945647@linaro.org/
> > 
> >     Add more examples to exercise constraints.
> > 
> > v3: https://lore.kernel.org/all/20240226051645.414935-1-andrew@codeconstruct.com.au/
> > 
> >     Base on v6.8-rc6, fix yamllint warning
> > 
> >     Rob's bot picked the missing `#interrupt-cells` in the example on v2[1]. The
> >     patch was based on v6.8-rc1, and going back over my shell history I missed
> >     the following output from `make dt_binding_check`:
> > 
> >     ```
> >     ...
> >       LINT    Documentation/devicetree/bindings
> >       usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v] [FILE_OR_DIR ...]
> >       yamllint: error: one of the arguments FILE_OR_DIR - is required
> >     ...
> >     ```
> > 
> >     I've rebased on v6.8-rc6 and no-longer see the issue with the invocation
> >     of `yamllint`.
> > 
> > [1]: https://lore.kernel.org/all/170892197611.2260479.15343562563553959436.robh@kernel.org/
> > 
> > v2: https://lore.kernel.org/all/20240226031951.284847-1-andrew@codeconstruct.com.au/
> > 
> >     Address feedback from Krzysztof:
> >     https://lore.kernel.org/all/0d1dd262-b6dd-4d71-9239-8b0aec8cceff@linaro.org/
> > 
> > v1: https://lore.kernel.org/all/20240220052918.742793-1-andrew@codeconstruct.com.au/
> > 
> >  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 149 ++++++++++++++++++
> >  .../devicetree/bindings/gpio/gpio-aspeed.txt  |  39 -----
> >  2 files changed, 149 insertions(+), 39 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> In file included from Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.example.dts:91:
> ./scripts/dtc/include-prefixes/dt-bindings/clock/ast2600-clock.h:14: warning: "ASPEED_CLK_GATE_LCLK" redefined
>    14 | #define ASPEED_CLK_GATE_LCLK            6

The examples aren't isolated from each other, so you can't have 
conflicting includes. You'll have to drop some of the examples or drop 
their use of the conflicting include.

Rob
