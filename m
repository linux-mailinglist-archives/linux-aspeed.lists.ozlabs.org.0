Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72693FD0D6
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Sep 2021 03:39:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzmtK4H5Tz2yJ1
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Sep 2021 11:38:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzmt93qhxz2xWx
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Sep 2021 11:38:40 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id c79so1704767oib.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Aug 2021 18:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkTvXd/OXCPZFirPQZmYlHm/KbbHKoDGKpXR0196NUM=;
 b=ORS3OzGzZn2dlJMmjn+9K4kdXcMDR1zKqYTmCwWPLCpQSjmCNn9TGJZ+7ewLEVW1NG
 DAk3edtt3l79ZmrWqVd/GL6WHXB8oIgAA4Z1Wp0kMUtqDd7kC/69Ih7HayDpTEBDb/Bl
 dAudmPGo5NOI1csspONQY/rRcHVxdhsRea7QOKwZ/4plhAaKS6GYkcY68d6oWNktwP+o
 hBZv9HWHS1YZiPQ5IxV3DGdKTv5t+7ocXRx1dT227JQLlCf/K4AhD2bw5Iv+G9R7CBQr
 pqr6+9iHCyJ/ySV6Y5bv+Byh9NQUIIB7XGVmTFyWsQ3qojEuUi+YNmzg5eNSXZD8lVt4
 D25Q==
X-Gm-Message-State: AOAM530clNyDVMqv0vuuB+lMdtsee1CL544o8rnZxAX5U+/+8qpz8fVc
 xO2HqVWJltnFiQvsDXJyiA==
X-Google-Smtp-Source: ABdhPJw8XN6RFsEE8lVBAG5RX6KeqUwC9q/4Uz5cvep/tRytpYwCGBe1ZDT+bYShKYR2qxjwSiSDEA==
X-Received: by 2002:a05:6808:aa8:: with SMTP id
 r8mr5536583oij.171.1630460317663; 
 Tue, 31 Aug 2021 18:38:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s206sm3953218oif.44.2021.08.31.18.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 18:38:37 -0700 (PDT)
Received: (nullmailer pid 1009336 invoked by uid 1000);
 Wed, 01 Sep 2021 01:38:36 -0000
Date: Tue, 31 Aug 2021 20:38:36 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v5 02/15] dt-bindings: iio: adc: Add ast2600-adc bindings
Message-ID: <YS7ZnG05pZvfA/7m@robh.at.kernel.org>
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
 <20210831071458.2334-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831071458.2334-3-billy_tsai@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 linux-iio@vger.kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, jic23@kernel.org, pmeerw@pmeerw.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 31 Aug 2021 15:14:45 +0800, Billy Tsai wrote:
> Add device tree bindings document for the aspeed ast2600 adc device
> driver.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml  | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
