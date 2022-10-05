Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F85F5521
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Oct 2022 15:14:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjFQm6Fgrz3bmC
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 00:14:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.48; helo=mail-oo1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjFQd3mZNz3bYM
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 00:14:15 +1100 (AEDT)
Received: by mail-oo1-f48.google.com with SMTP id s1-20020a4a81c1000000b0047d5e28cdc0so6757742oog.12
        for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Oct 2022 06:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Us1gbC0HCIGjXgoBGtMUQS365+04o6By1VntKrKN464=;
        b=kDx48VZJDHJSSQuUIbXnOnyfWH3tMMxy0n33oEGBdK9PVAAhJG0uOpmQblxu06rAfU
         qdC4cWFbRa8QzgWtba4VlsIyd59omK4kYZ7aL4UVGYd/lsv8lPRqVxwSsrQKcgNrnhor
         VUkUV1VYwD6F1oEmQfhSYm0O3LF1Wd8SBVL/CTbbj8I9OiU8S415y0gWzm3u/aKg8QrR
         l/IqTV3IgeQV+oNO16MTGHR6LULU8LtRiDqLsx/I9ZPyKk0Rs6i00geZ3/943dEUAcMy
         2eCbRMZRflsfUlv7vJeQGYlRlikVYxhPwF0vyk6vwYMObOTr+S2h76o+KhMuM4bxg+Pt
         UkWQ==
X-Gm-Message-State: ACrzQf28JwiAsdiEjrKduv9NQq5D4SRLkZVcbak3UwNQS4MC2oKuadYI
	ydMNA5MlMNFWBjjCvbikEfvRSNl4JA==
X-Google-Smtp-Source: AMsMyM4yGZNVEZO0gUm6Y1ZYmOt9sQSiHOUHoREsWyfAZ4rDf7s5fnnpasq/0f77SctWwdx487lmtw==
X-Received: by 2002:a05:6830:3115:b0:658:ea61:249c with SMTP id b21-20020a056830311500b00658ea61249cmr12204357ots.225.1664975651409;
        Wed, 05 Oct 2022 06:14:11 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:5fee:ea3a:4239:ad4:650a:6e66])
        by smtp.gmail.com with ESMTPSA id p189-20020acabfc6000000b00350f17527fesm4170243oif.28.2022.10.05.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:14:09 -0700 (PDT)
Received: (nullmailer pid 3256258 invoked by uid 1000);
	Wed, 05 Oct 2022 13:14:08 -0000
Date: Wed, 5 Oct 2022 08:14:08 -0500
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: crypto: add documentation for Aspeed
 ACRY
Message-ID: <166497564756.3256206.1489547324996590627.robh@kernel.org>
References: <20221004032841.3714928-1-neal_liu@aspeedtech.com>
 <20221004032841.3714928-4-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004032841.3714928-4-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 04 Oct 2022 11:28:40 +0800, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed
> ECDSA/RSA ACRY Engines Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  .../bindings/crypto/aspeed,ast2600-acry.yaml  | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
