Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E46CF10D05A
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 02:23:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PGwZ6xDBzDr9T
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 12:23:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="dTehSbOk"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PGwL5yQDzDr7s
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 Nov 2019 12:22:58 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id a137so22391407qkc.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Nov 2019 17:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i702aI34Ezre+0jrw+L6vx9jKRLYCS8yu6Eoq+4nGJE=;
 b=dTehSbOkY05Dr9nkgHtoKE1xSiDuW5wG/Ajt1b3KazxlRGS9m76EmQ0EGoKnsfLbPb
 Duue+a7zkw1MO0Gzq2mA7tdyiQd1nS3VT3d3UkK3yXBnNGvLy/ZTkLPilzlW40pp3+me
 NlZ4IVSvcbXLRiRtthWxx0lEasUQXG07FUQkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i702aI34Ezre+0jrw+L6vx9jKRLYCS8yu6Eoq+4nGJE=;
 b=LYOatVIYpruFMFewgZGuizM9EyzxF1DqKAwV2BC0W8jbvIu7EMySvkiM6hjOvPn/NA
 WXdsllf5D+xAc8XuI0c2RxJYDlwtpRbx3HLACGKJYlbVBvzeCa2zmsTFjYF/gkceXVif
 6HVxzrYUuEJaLRTR/7vEVyKyiipuuVU+0IWMnE+LE+d5tjTHu354o9tgW1ZkNK+WEDxz
 mYYUKTPE6JqskH1CnrATodJSz7lV3b9uSehjEoZKhl+7BwlxeKbPmR1T54mHUjPW/vBM
 6/917aR50mc8szEl1Yph4qNNBcb4N5qIuaRX/HS1afIlKAKIIUzNc50+0gBuq/QF3Br1
 LYxg==
X-Gm-Message-State: APjAAAXUN3XOHAKQFD8exZ6qJLUcBe01f7jQcFhitR1uuFTcUN7YEM+c
 Whn0qLfouA6M4hYMWqgB0v6BoOgaEQ0smv4uGcY=
X-Google-Smtp-Source: APXvYqzz9CXdrxz6xF/zS1AxHhxumwbTlTDCuJZgIlcJE1zBHaC5e91x03jmrOXsqeNZRVN0YWwsyRZ5BX10t1m375k=
X-Received: by 2002:a37:dcc7:: with SMTP id
 v190mr13463552qki.330.1574990574036; 
 Thu, 28 Nov 2019 17:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20191010020655.3776-1-andrew@aj.id.au>
 <20191010020655.3776-3-andrew@aj.id.au>
 <20191126180320.1A2132071A@mail.kernel.org>
In-Reply-To: <20191126180320.1A2132071A@mail.kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 29 Nov 2019 01:22:41 +0000
Message-ID: <CACPK8Xd73GokmT=6ABDQSJoumHL4aMLx3R2qkp9PqGThRExz8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add RMII RCLK gates for both AST2500
 MACs
To: Stephen Boyd <sboyd@kernel.org>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 26 Nov 2019 at 18:03, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Andrew Jeffery (2019-10-09 19:06:55)
> > RCLK is a fixed 50MHz clock derived from HPLL that is described by a
> > single gate for each MAC.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
>
> Applied to clk-next
>

Thanks!
