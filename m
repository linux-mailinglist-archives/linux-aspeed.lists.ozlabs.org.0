Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DE4625D8
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Nov 2021 23:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J30h90M6tz3cb5
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 09:41:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J30gt0Yvnz3cY5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 09:41:13 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id r26so37444078oiw.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Nov 2021 14:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/mVagZKB5sENnWA5/x92h5prjYHHYygiRoEd9UYVS20=;
 b=KvLoZ65Q40X4KpFH0QzHd/JZpM8HbELshv/wWfiy4fovgfYWxhFCuzbVZccK+wspIJ
 ZOaNBS8f6J01lkYgaXqmXjbN3+80X+5avJ7af0v0zQXHxicA6qqkSmIb3FZBB5rjkbP/
 7sIiyYGH57LICAuJiUa76Hd2hNMk+I4uP1Jl3EC62tGwevMj7l7Urx6nmo6tks8h7kMg
 L3jk/7P0gRATmQHE5gwBMVONU3JCLoc5JISXuwibSYCgcv0dYdSyYVqVmOlaNm4o/xr/
 BDqVDx7Hy/8trJeJb3hg0xsp2JhucPYsm1l//nGHhZQiP5t+UWqiy99bxfwrIUyPbHCs
 cLGw==
X-Gm-Message-State: AOAM531Shou+6/PbXLofIjlckU1HBiEB39xxOotnMu70ldFO6d/g1C8Z
 VY/lnSiybf15VmgWC8CM2Q==
X-Google-Smtp-Source: ABdhPJzPrmQTisKPqX+mcQG21GYX6RJWb/RaFSFgyZkE7/CVaR4iKXleUPZI2cSTY9KS1sSs9GCAbA==
X-Received: by 2002:a05:6808:1644:: with SMTP id
 az4mr877879oib.86.1638225671084; 
 Mon, 29 Nov 2021 14:41:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q9sm2857314oti.32.2021.11.29.14.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:41:10 -0800 (PST)
Received: (nullmailer pid 743486 invoked by uid 1000);
 Mon, 29 Nov 2021 22:41:09 -0000
Date: Mon, 29 Nov 2021 16:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/3] dt-bindings: aspeed: Add Secure Boot Controller
 bindings
Message-ID: <YaVXBZb2QFpjEGtj@robh.at.kernel.org>
References: <20211117035106.321454-1-joel@jms.id.au>
 <20211117035106.321454-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117035106.321454-2-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Paul Menzel <pmenzel@molgen.mpg.de>, Andrew Jeffery <andrew@aj.id.u>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 17, 2021 at 11:51:04AM +0800, Joel Stanley wrote:
> The secure boot controller was first introduced in the AST2600.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../bindings/arm/aspeed/aspeed,sbc.yaml       | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
> new file mode 100644
> index 000000000000..c72aab706484
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)

GPL-2.0-only OR BSD-2-Clause

> +# Copyright 2021 Joel Stanley, IBM Corp.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/aspeed/aspeed,sbc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: ASPEED Secure Boot Controller
> +
> +maintainers:
> +  - Joel Stanley <joel@jms.id.au>
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description: |

Only need '|' to preserve formatting which you don't have.

With those addressed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +  The ASPEED SoCs have a register bank for interacting with the secure boot
> +  controller.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: aspeed,ast2600-sbc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sbc: secure-boot-controller@1e6f2000 {
> +            compatible = "aspeed,ast2600-sbc";
> +            reg = <0x1e6f2000 0x1000>;
> +    };
> -- 
> 2.33.0
> 
> 
