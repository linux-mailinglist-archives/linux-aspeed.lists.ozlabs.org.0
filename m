Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB241CF19
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Sep 2021 00:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKVvn57WCz2yJw
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Sep 2021 08:11:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.179;
 helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKVvh4jh5z2xtZ;
 Thu, 30 Sep 2021 08:11:27 +1000 (AEST)
Received: by mail-oi1-f179.google.com with SMTP id t189so4786528oie.7;
 Wed, 29 Sep 2021 15:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xe2Jz+HG0oynCJl0Rh79iqr/d53l3gDFqX1VxKfAJeg=;
 b=OfW00goHuMuvQynhsSuZyZSKuLwOrGu+TF9lKUkzqRxhDOiA6FDljz7/OV7Bti/xuc
 243AYTO4hs2hP6UYiDwlsW+AmVvncllggUEmRNsYWbz8mSJZ+fObKZ0ppq/CidT4bWWy
 +RnMSh1Ln2t69iDvYI2n04r8YosCHLgKXG3LmHNMvdC1pqdzi6rCK1mT0ztv3GtXIXs3
 1f3w/0LDPUZ/A7H8b3Du9aUnZpeMTBtgreIwF8kwQ7scIGo09WInSCNy9MwFM0Uc7KOz
 mIuoECdbrN006r+SeDEAczj5ZQlf8oDDEILADSm0Cc476heJUDbF1LE28AepaOw4ggZH
 ttYA==
X-Gm-Message-State: AOAM530cXvtVxo0E9qb/D3fZGG31lLM5CSlea7Rs4aoCiJ9hiwowQdCr
 Rbo5AGQtJCeK+n5/CmnD0Q==
X-Google-Smtp-Source: ABdhPJy/+/VB5A39jM44w1plBCdCfDo7DjkavPi1UzNuFA1EpZDX2UQk/OCAu6tqg2tZ2h0FWKJbAA==
X-Received: by 2002:a05:6808:309f:: with SMTP id
 bl31mr17941oib.41.1632953485705; 
 Wed, 29 Sep 2021 15:11:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k2sm207954oog.5.2021.09.29.15.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 15:11:25 -0700 (PDT)
Received: (nullmailer pid 313269 invoked by uid 1000);
 Wed, 29 Sep 2021 22:11:24 -0000
Date: Wed, 29 Sep 2021 17:11:24 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v7 3/5] dt-bindings: aspeed: Add UART routing controller
Message-ID: <YVTkjKdXcyIVImmP@robh.at.kernel.org>
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-4-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927023053.6728-4-chiawei_wang@aspeedtech.com>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 osk@google.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 27 Sep 2021 10:30:51 +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed UART routing controller.
> 
> Signed-off-by: Oskar Senft <osk@google.com>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++
>  .../bindings/soc/aspeed/uart-routing.yaml     | 56 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> 

Applied, thanks!
