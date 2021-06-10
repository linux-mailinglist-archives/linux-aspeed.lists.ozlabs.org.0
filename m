Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F513A3060
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Jun 2021 18:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G18Kh1YlSz30C3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Jun 2021 02:18:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.47; helo=mail-oo1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G18KY3dwCz306T
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Jun 2021 02:18:23 +1000 (AEST)
Received: by mail-oo1-f47.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so18114oor.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Jun 2021 09:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zowArRjAAnzKvHBN+RPg0/JH6reTanVtBG1ZhO+au30=;
 b=JwACaRp+KMCbW1aIql1ypnoAoySHisANbO0Rhmaga57wBBVEIX6b5Y/mC4M8e82Rcn
 76SIfN2kZwLERboU03dbaXqLd1a7ZshwLMT4nV0RaTed211Km+JzkHjHG8NQw5QO+ujm
 rmk5ngVaOuaBFZ1xAtAIcCfRutqf79aAafBIJNPsudL2bOCPUW7LQdQZWbQyhHgiaGcn
 JejI7+CsWR9Ie1Jix/v6yQfzhtNdGZwM6KBcEqYXe0O4v/3XhChHcOyQrEE2vL29bLsF
 G7ty/4GcvdTr0k7Ut2BFmh37AvLJF6z+0UdBt5KHerCHi9iQDHBIDc8EX48IQpqbY2RL
 hqmQ==
X-Gm-Message-State: AOAM5339CteJ9m5RqXTFl+Z8cexzE1HvpOYnTcVc13j056qxi4y81I/N
 o1cBamJ0MgCWdF4ln06R1g==
X-Google-Smtp-Source: ABdhPJxDa2nJg5IbToRfbbwFxUmVIEpzV4GOafbjOpqGflOC3KFiwmEQEvu7SFxiC9JxpaBHK8QyWQ==
X-Received: by 2002:a4a:a9c8:: with SMTP id h8mr2975424oon.1.1623341899426;
 Thu, 10 Jun 2021 09:18:19 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id x187sm637622oia.17.2021.06.10.09.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:18:18 -0700 (PDT)
Received: (nullmailer pid 1910178 invoked by uid 1000);
 Thu, 10 Jun 2021 16:18:15 -0000
Date: Thu, 10 Jun 2021 11:18:15 -0500
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210610161815.GA1910106@robh.at.kernel.org>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-2-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608102547.4880-2-steven_lee@aspeedtech.com>
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 08 Jun 2021 18:25:36 +0800, Steven Lee wrote:
> sgpio-aspeed bindings should be converted to yaml format.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 75 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ------------
>  2 files changed, 75 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
