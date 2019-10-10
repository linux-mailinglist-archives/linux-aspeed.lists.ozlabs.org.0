Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B98CCD347D
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 01:42:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q70z47TWzDqS2
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 10:42:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cO4Crqi0"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q70s70bbzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:42:21 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id c21so11257795qtj.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 16:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v9QoBYfKdHi53Oe2RDIOZ1fzd9eCKG99mcIBTMrkokE=;
 b=cO4Crqi0GzQ/SvRKjHRewM/6j5N3rPugEyhlFQAZBlUAKfoJTxKICJKQKZ8FBeVlAr
 zuquO0vrc7zgoMnhK45GwcTxKyziTrdzB+PgfKobgtANFJHI1/2RXmDgqtidhyqVrGOL
 pjOUdH0J3wO5zQ2DAm8yztXLZqxwAdj9HLUyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v9QoBYfKdHi53Oe2RDIOZ1fzd9eCKG99mcIBTMrkokE=;
 b=Fvizre+yRDJpPBZZPX+5CxH5XavFvFef0UyEKVwRyH7mtFaxloSsxj/DV5gwWBBtqg
 1/CTKwYEdgTVmfu74OuPDpY8UI4YV+HubznwlgFIXMGkrchuHxhMHka27qQ0oIb2irQN
 lj/0mTE4M8S1iUYxuwWrxIg225044A4PCVrci5WkSUuQqMhI+ZaSWDyvHNwDC4dHgOuI
 867naS8ozaQ/IZqXQGwCp7g27Im7etNmNiA/s6oMQjU456sxsjcGqrS0rTfLdLIRcf1k
 6Nky8Ok/cA7oxNzeancpEi524GgbWwTNvNDaTQE20zOQzW3KCpKm3Y8g1Zp5L9ayWHsj
 aTXA==
X-Gm-Message-State: APjAAAWkRkYkIGVB+q+eQZ6/o/xBeYzAS4HEcLxjuEziGKjYJTUt3wId
 MP0T7lcEoJfqXC3sy2CVw08g/w+GHLugpnY56ws=
X-Google-Smtp-Source: APXvYqzWepm2QMbtM7Mlxs1tWOx71xVvtmYjHL4TbcTYDDyesblSnW1JaBWkhPEpMEvXlcb/54LEXpm0ZrudpV1tBa8=
X-Received: by 2002:a0c:f792:: with SMTP id s18mr12877457qvn.20.1570750938971; 
 Thu, 10 Oct 2019 16:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-2-andrew@aj.id.au>
In-Reply-To: <20191010020725.3990-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:42:07 +0000
Message-ID: <CACPK8XfqA3O+qWASdZdua8oDqe4GWVjB9HkSu_Aw8jqbQ9QHBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
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

On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
