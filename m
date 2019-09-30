Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB187C2625
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2019 20:59:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hsCF5G1GzDq9R
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2019 04:59:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hsBy6FGhzDqPk
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2019 04:59:22 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id z6so9323137otb.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2019 11:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qttcrBHS0kIn8DMgwWljur1/ogNYEuQG7wPRDTGlx3M=;
 b=GS9X6OUSHvvjqxZE4T0IZN4R/BSKfQNBf+5PwQHZOpeTnw1sK5E7LRkVRrpU3RADKJ
 dglCcK4pgb0rgmS2FSDXBjB6dmx7hfe23Hpt9OBWgLYEN1CNqTnmh+iS0syIFufKDsGE
 ByTfoAz3yZZh3uqw9T5QZ6Ilg2j8LE5W1Kwm90mT7jqIKsq9JwKpBOg0Myi4zRw2feTa
 tUJ8CE2VejAl+ADX9Hfu8KYGZRkyDbvS03StWkLGX74ocYxEVsSG6YMFUiA3nCLK46Ov
 3387bsEeekVc+0pswkkz84ciZgCFfhPP3BZSrTnTEvcMO6eiCvEp9zcpn//xKQQyLp8U
 NM9Q==
X-Gm-Message-State: APjAAAW+NrGfZmJBW2UtfNwDI5ecUAhsTbd6SV8b6de4odem+2saBHBr
 cgcpFoqmmuFSaxkcUcXNNg==
X-Google-Smtp-Source: APXvYqxBaCMEenuVO/TLEa22+nQKS8epFGf8JVek9VBh07i8c+Qw+sc7bz02Xq20jisGQ0FY5ulbtA==
X-Received: by 2002:a9d:6084:: with SMTP id m4mr14638230otj.6.1569869959652;
 Mon, 30 Sep 2019 11:59:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 5sm4127490otp.20.2019.09.30.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 11:59:19 -0700 (PDT)
Date: Mon, 30 Sep 2019 13:59:18 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Aspeed: Add AST2600 compatible
Message-ID: <20190930185918.GA18431@bogus>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2019 at 11:35:10AM -0500, Eddie James wrote:
> Document the AST2600 I2C bus compatible string.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index 8fbd863..b47f6cc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -1,4 +1,4 @@
> -Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
> +Device tree configuration for the I2C busses on the AST24XX, AST25XX, and AST26XX SoCs.

Perhaps s/buses/busses/ while you're here.

Acked-by: Rob Herring <robh@kernel.org>

>  
>  Required Properties:
>  - #address-cells	: should be 1
> @@ -6,6 +6,7 @@ Required Properties:
>  - reg			: address offset and range of bus
>  - compatible		: should be "aspeed,ast2400-i2c-bus"
>  			  or "aspeed,ast2500-i2c-bus"
> +			  or "aspeed,ast2600-i2c-bus"
>  - clocks		: root clock of bus, should reference the APB
>  			  clock in the second cell
>  - resets		: phandle to reset controller with the reset number in
> -- 
> 1.8.3.1
> 
