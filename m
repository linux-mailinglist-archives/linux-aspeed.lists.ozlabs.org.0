Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A1D3473
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 01:40:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q6yP5shCzDqS7
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 10:40:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BAVg1aEQ"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q6yG1L6lzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:40:06 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id u184so7285061qkd.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 16:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzY2GiRsLdKkNjOULOmOY2uh2S6GFNejWSTG+vyFaHU=;
 b=BAVg1aEQqMRenewRVbfHesEnWeY+3OjzO2is/qAbM5snBow68FC34L2LRa1QaZ3eR5
 9Hk1wAjLnBY22hsxQRBsMj4hM26tHiYTXepbuzNl9+eRSSK3tvAvBTPCqWCj6HZbftgd
 F3oFG0waiCp5yvWHjy7xElgo8yxABrzwKmroA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzY2GiRsLdKkNjOULOmOY2uh2S6GFNejWSTG+vyFaHU=;
 b=VO2y+7fmaD5e0XKaphX37d6Cmacozq5zLTiEPv7D76ByU5rPUzawQDrh5stsp+Be4S
 QcyF4+fCX4hcs8oYnYoqrflBBngaOfpTVYk2ITMOIG2+YEuwv1aEY6PANBJPBA+QE9w+
 N9eRjFc/gSF23rmgc4DbrZB0V0Ii0yClqt40xi/N9hSJe6ubBvo2OyUklppfARGhY7oS
 poiyL9R9/09mCVBwI4qDb8Puz2Rn1boXgrM5wzKmZCqFrQZb8fZm5n3Oq/a87Yh7Cd5h
 KnOr//GeoUUOdMxb/Vc9WqbvmwqS76dBKmgjoIu3XqMtuYJuSxYcyYIKxJpiMuLps4S+
 0pqA==
X-Gm-Message-State: APjAAAUMzRZ1pYR2AafHOeIiLOC7+2G6a/IUn4wSKASKEAFAQJQ6+ZWK
 lQlercDy1Y+n2Dbe9RetYXXUmdlfbPGSJQMdlYM=
X-Google-Smtp-Source: APXvYqx12wus94E93QLNJZDQFKcLjtUWJadRRN6O4zaoD5brzLAp2CQYDAJzj7qrNBW2/PzPYUcsc4tkO6fvhiMuSlM=
X-Received: by 2002:a37:8d1:: with SMTP id 200mr12927454qki.330.1570750802156; 
 Thu, 10 Oct 2019 16:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191010020655.3776-1-andrew@aj.id.au>
 <20191010020655.3776-2-andrew@aj.id.au>
In-Reply-To: <20191010020655.3776-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:39:49 +0000
Message-ID: <CACPK8Xc2mibu+Pqi7ejGT_M24oprgoOik3Z8=fP6NVgEQeZYZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2500 RMII RCLK
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

On Thu, 10 Oct 2019 at 02:05, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2500 has an explicit gate for the RMII RCLK for each of the two
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
