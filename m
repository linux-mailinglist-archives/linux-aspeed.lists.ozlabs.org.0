Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714BCFA48
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 14:45:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ncXD331TzDqK9
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 23:45:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QXFzeHuf"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ncWz5L9jzDqGZ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 23:45:33 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id h126so16535508qke.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v98zF1OGy1a9xdf1tcg4rO9aTmICS20KeVZPXiAVZ6g=;
 b=QXFzeHuf81gSpH57PDwEHoXnUMf8/WnURr1eH6LbCgjtzvlECfhgrOaugs8bUyVTa5
 IN2earqrMs23m6T89TNg+NgWHJq+QvdQoc0ufRkTf0lkD8UnzdxXKWXEoHutopPYOV24
 JDbyyAq7Mfk3JRcyLzr7IuC1s9MNUFNiLWH94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v98zF1OGy1a9xdf1tcg4rO9aTmICS20KeVZPXiAVZ6g=;
 b=VEapVSsdXF8ZRVb8lJXWB2fCZijvtMzqgbDr1NRIUwRSoikEr/rkNttaYBwfcMO2HG
 O1kGcowgmVjTGkWnH43p+StcTn3PIiqJLUpeljUOOR7xFIl3EpWe1Qy+6er57MmE4oIH
 nhZVrgBAGrFaPDL6F7WqFad3PE491GhnzxYoKDSJ5PfdOA6d4xPQj7pNvvgtGVTKJ+Kk
 dXuIjXlJ7AJGM/5RLzv7gxtrK2Mnq9mwmNFRwAY66b3hm6IASZenzHzFAzfaUqFd81Gj
 +3ODa4xZCXSx54j0uv/o64oqfpKzSghabOXyX6UQUGBjFHUDAXD8TvuS801kyqgM4PNw
 oUkQ==
X-Gm-Message-State: APjAAAVkJoGeErDQUmK3vO2rpELRz6gab8krcSkWLhRiw2MeuK97E9YU
 Nu9Gm7jBBAiEzaadmq1VSM/bRy3crzS0mo7fQh4=
X-Google-Smtp-Source: APXvYqwbDrpR/sws3f6gujWo90eWmFtcR1qTkid+2DQ9qP9pCJc95MfjkQRPPxEaORjJBbxZSD9h/vhA8oS6KXrRLvY=
X-Received: by 2002:a37:4a54:: with SMTP id x81mr28662696qka.292.1570538729054; 
 Tue, 08 Oct 2019 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191008113553.13662-1-andrew@aj.id.au>
 <20191008113553.13662-2-andrew@aj.id.au>
In-Reply-To: <20191008113553.13662-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Oct 2019 12:45:17 +0000
Message-ID: <CACPK8XcGAN6AF_GqUpCjFL3CEDeY42n0Zsgt5DX1ssOu+GhbDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index 38074a5f7296..ac567fc84a87 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -84,6 +84,11 @@
>  #define ASPEED_CLK_MAC34               65
>  #define ASPEED_CLK_USBPHY_40M          66
>
> +#define ASPEED_CLK_GATE_MAC1RCLK       67
> +#define ASPEED_CLK_GATE_MAC2RCLK       68
> +#define ASPEED_CLK_GATE_MAC3RCLK       69
> +#define ASPEED_CLK_GATE_MAC4RCLK       70

My comments on the other patch about GATEs should have been on this patch.

> +
>  /* Only list resets here that are not part of a gate */
>  #define ASPEED_RESET_ADC               55
>  #define ASPEED_RESET_JTAG_MASTER2      54
> --
> 2.20.1
>
