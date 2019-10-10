Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741FD3477
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 01:42:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q70S12qbzDqRn
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 10:42:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KE2L3z+y"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q70J1rLLzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:41:51 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id y189so7286377qkc.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qJAWywHBsS6HezKNK9ZjvcaTD5FSbDwrNVdcNRgDm5o=;
 b=KE2L3z+yLugM41vE7B7L/+3dd9xTaYJgrmfANqDmI8fbCFLsh0UujCnqd9/8GWOH8B
 UfhgN3vbEZ/X88jSoXyYh5P+uZ43u7Nm3c5BhOIAsmbyXB7guZN7BVxGP4lhE+Tuq9pR
 TMhy5BL1/1QjqdjMRFYvuws7J7g7sEDgr0q4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJAWywHBsS6HezKNK9ZjvcaTD5FSbDwrNVdcNRgDm5o=;
 b=UdhVQcBZXKD4oppv4dx/DeeDwIOJe73ZmGTXJTeA5cSN4WFenJeeS542eKfmOW08wd
 yb9Rl9iD+A5Weq8825Zg36dnFqUikk9TKnCFBJ+1ru73C81IM5kn/a4vBSZ2gTZEVe5G
 igE7hacGVcDzqzd0VWb8RQusdLA8T2GWUYserxzxPw6VjeAptzV2lJ6l9LlOVFB8zw7P
 mJfaobz6pBdoi4GMIzL+HpXzYpXNp8ri61abbAj0ygYgt7oFthZtZKsfLUBXMsUFACMM
 jkAxdzs9X8Gxso96ihFH3Jhkj8pcO9/c87UhQQCYlZua00npk1lZ6LMrNA4hLY2IDvCQ
 VOrw==
X-Gm-Message-State: APjAAAVQ0i99zqvzwjSyPj4OUcsVPGUiDbv8UYj/uJ2tIBkktPNCXSGF
 24yV8WElDcR/KNSo6lccO/t5eztGZbrzzR3anGY=
X-Google-Smtp-Source: APXvYqzF4Bybt3eQo1Tnv/6kiOrhu88uAqhznHPcGo14GIAGi4u2VEbpqF+T4r85m7xuYjknEB0C6RBGaWMOJSajbhc=
X-Received: by 2002:a37:4dca:: with SMTP id
 a193mr12683477qkb.292.1570750908045; 
 Thu, 10 Oct 2019 16:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191010020655.3776-1-andrew@aj.id.au>
 <20191010020655.3776-3-andrew@aj.id.au>
In-Reply-To: <20191010020655.3776-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:41:35 +0000
Message-ID: <CACPK8Xcrc_2itUcGw6caa8Fp3sJE8oHBO5LJgBtqScwmVAuHJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add RMII RCLK gates for both AST2500
 MACs
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
> RCLK is a fixed 50MHz clock derived from HPLL that is described by a
> single gate for each MAC.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
