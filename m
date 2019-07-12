Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB266F80
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 15:04:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lY6G2DZHzDqQ5
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 23:04:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="tn4/f9n/"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lY651vPgzDqPl
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 23:04:12 +1000 (AEST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7477A208E4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562936650;
 bh=j08i/yzt8yihm95wbKxIa8ANHeLTJGyB1LowMPZRoQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tn4/f9n/k299HHdLN0F6ScJZKf/VYffpnnAYh+PPAzA7ZjRWQFYrqKf+oTQV+fuy4
 ACXtzrbqpM/naLe0Cz/a11svW1mUDqExyut4Wh/u8EXdbSDYghpYV5xdCObec1WWpU
 LNbCdcMo3gwFzWE9scGST+eZVaGIXGMXzio+pSbQ=
Received: by mail-qt1-f182.google.com with SMTP id n11so7951786qtl.5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 06:04:10 -0700 (PDT)
X-Gm-Message-State: APjAAAUTgkVg43xHn+3yjWCmnTVmkrQ3qGB4lWqTAhaNEh3pDIGWpKMj
 UqNaqyGbxvCKtIswY4+GAeehOT7LDKBjdND4Kw==
X-Google-Smtp-Source: APXvYqy0Gw33CPTr5i9Ny8C1aCwNSn1BsAcArqdhs4L6Ao3k4lrTO3dV3h27CfJYvsBcR6H2d01/a3fqfjUcmFKloV0=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr6598069qve.148.1562936649734; 
 Fri, 12 Jul 2019 06:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190712033214.24713-1-andrew@aj.id.au>
 <20190712033214.24713-2-andrew@aj.id.au>
In-Reply-To: <20190712033214.24713-2-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 12 Jul 2019 07:03:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq++J+K2goHiNrHJGnL6vrLjmKhM+vpYO=sTnmv6fm2sog@mail.gmail.com>
Message-ID: <CAL_Jsq++J+K2goHiNrHJGnL6vrLjmKhM+vpYO=sTnmv6fm2sog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: Document Aspeed SD controller
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

On Thu, Jul 11, 2019 at 9:32 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the
> SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> data bus if only a single slot is enabled.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> In v2:
>
> * Rename to aspeed,sdhci.yaml
> * Rename sd-controller compatible
> * Add `maxItems: 1` for reg properties
> * Move sdhci subnode description to patternProperties
> * Drop sdhci compatible requirement
> * #address-cells and #size-cells are required
> * Prevent additional properties
> * Implement explicit ranges in example
> * Remove slot property
>
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
