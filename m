Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BA3A307A
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Jun 2021 18:23:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G18RQ5QT0z307j
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Jun 2021 02:23:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G18RN4sRcz2yYL
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Jun 2021 02:23:26 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id u11so2723242oiv.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Jun 2021 09:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ajFMbmV13rSn+GZr+FQLaWoaYSbQZYLeXPdRKVG1MtA=;
 b=PDScau+ovYNNldYkZQVWQzZj7K6ptrVxJHsDWiI7A6FhAwqenOD2g8S7N7vP6uOdTu
 zPfI3PJLJSbss1JjUf2xisoeEBAYKPt7VAB4SGCLwv8TnZeAHdVV3VcoSq0hY28+6Fer
 gkfXtb6M4SIsYicwvR58JUskgJNvSffwxpIHX2xuHMGveiV+4k7+mllWvExoTLzR44KM
 tZnl0ZkQuI+KmczVwG4jIDWGYPa2HkEkPx7T7PwBaVwQLNKgxU+xcFLA6TEnk05WMCtm
 MPb77uvzc0vJWTGMVDekuWlqkaBe0fQIAuGZEXsEqsOzCbWmP+kN+f2x0zJd9X0yT5q7
 17Vg==
X-Gm-Message-State: AOAM532RmqmHJt2HRl5E1wgusbGJlKoXvDiE3MdATl73vSFA1uJSvVaL
 tBTPU2R+bDG/skRwb23b7A==
X-Google-Smtp-Source: ABdhPJw4r/ruF84yQMzuAkmhN9owEOanbliqra7Rbz4SR5J1wnvK6z9pA0sJEYhLuP2q3B5VVOi5pw==
X-Received: by 2002:aca:d485:: with SMTP id l127mr4034718oig.106.1623342203689; 
 Thu, 10 Jun 2021 09:23:23 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id x24sm674126otq.34.2021.06.10.09.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:23:23 -0700 (PDT)
Received: (nullmailer pid 1916785 invoked by uid 1000);
 Thu, 10 Jun 2021 16:23:20 -0000
Date: Thu, 10 Jun 2021 11:23:20 -0500
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: aspeed-sgpio: Add ast2600 sgpio
 compatibles.
Message-ID: <20210610162320.GA1910317@robh.at.kernel.org>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-3-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608102547.4880-3-steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 06:25:37PM +0800, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibles
> and update descriptions to introduce the max number of available gpio
> pins that AST2600 supported.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> index b2ae211411ff..0e42eded3c1e 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> @@ -10,9 +10,10 @@ maintainers:
>    - Andrew Jeffery <andrew@aj.id.au>
>  
>  description:
> -  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> -  featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> -  support the following options
> +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> +  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
> +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
> +  GPIO pins can be programmed to support the following options
>    - Support interrupt option for each input port and various interrupt
>      sensitivity option (level-high, level-low, edge-high, edge-low)
>    - Support reset tolerance option for each output port
> @@ -25,6 +26,8 @@ properties:
>      enum:
>        - aspeed,ast2400-sgpio
>        - aspeed,ast2500-sgpio
> +      - aspeed,ast2600-sgpiom-80
> +      - aspeed,ast2600-sgpiom-128

If the number of GPIOs is the only difference, then I don't think you 
should get rid of ngpios. It's one thing if it varies from one SoC to 
the next, but if something is per instance we should have a property.

Rob
