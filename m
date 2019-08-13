Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B38C42B
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 00:14:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467RpY4HCYzDqjd
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 08:14:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0uaRXv8D"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467RpQ39bqzDqRD
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 08:14:37 +1000 (AEST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B87320843
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2019 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565734474;
 bh=6wCizBaaZT2k/09mFrNXRExfBAwJv2YLSMnChPGtw4g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0uaRXv8D5HRtmKK3R9sZVd0gtdGEAJy9OAYrUbynXlMjib/y//8/8b1GMIl0koAge
 zvdeq5RXKS0RUpLgqM+wsU8tmSLaxzBvsjGnlrjpFHlq8frKD/7T7Y1NciVDfSwTpC
 34kSkZyb8+4NWRxQuPpvthHnzOYQkdnd6haJ4Kwc=
Received: by mail-qk1-f171.google.com with SMTP id m2so16734282qkd.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2019 15:14:34 -0700 (PDT)
X-Gm-Message-State: APjAAAWW5aJkggV7kJq6/CdylS+CKlxBVhewDhPWD9Uf/lfBwneedTpj
 LEIeNmlLn6UhEp8nI/Qc16cAIXUm83oEvc3Kqw==
X-Google-Smtp-Source: APXvYqwk126OivmGjH6r+ni/zAgOht3m3QXJodkzCFH+TUHs2iVPGSLnoqVVTdkeSVJkGVzE/d/O+3TNCBaPTI7BGz4=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr36131378qke.223.1565734473435; 
 Tue, 13 Aug 2019 15:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003629.2974-1-andrew@aj.id.au>
 <20190807003629.2974-2-andrew@aj.id.au>
In-Reply-To: <20190807003629.2974-2-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Aug 2019 16:14:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKXda7f43=ZdtTsyrdhdqn+H4L=7zQXtB_EEfHdi=rHLg@mail.gmail.com>
Message-ID: <CAL_JsqKXda7f43=ZdtTsyrdhdqn+H4L=7zQXtB_EEfHdi=rHLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Document Aspeed SD controller
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 6, 2019 at 6:38 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED SD/SDIO/MMC controller exposes two slots implementing the
> SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> data bus if only a single slot is enabled.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v4:
> * Make use of mmc-controller.yaml
> * Document sdhci,auto-cmd12
>
> v2:
> * Fix compatible enums
> * Add AST2600 compatibles
> * Describe #address-cells / #size-cells
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
