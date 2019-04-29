Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF80E860
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:08:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB1n1XBczDqSg
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:08:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="PosPp5gy"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB1P2JpHzDq9y
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:07:51 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id e18so4166161lja.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=s/4xwtUG/cKwNNv3hBRVLGCWHejEs70XonImzRvFPlM=;
 b=PosPp5gys1RLkjRFXyznCdadARcWawPbjUCapw+0DkAT04c2KewGwgcUnjlQPjN4EL
 Pay6WfEsAorzRzfqjbxpQwvhj+S6BsCkJF1Aj/M7GgT6fkrRBhxeSA8oQjZ8MnXNL55g
 RcXAyp/5LNr1zxaGspstUvCDRo6tzUVhBjojVUxEfZvVacIgWEPLpZNp/d7jQFI1fVyB
 jBmHyMU4J//xSQYjFgUUPZEDvadZ7Oymss3hEzQe0vrYoc0kpB0U+sL01MPGVQkfIHFK
 srUoGYSDVaayKysYH3dUnnNa9FdgeyiUulCNS3sfKykmFN0ym3aA3t+xY8MOVllZWGAX
 MHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=s/4xwtUG/cKwNNv3hBRVLGCWHejEs70XonImzRvFPlM=;
 b=Wjv/xe6EQ8Hp+QcNCuGIbuP+hchdHb6+htRbDu1jOHxM5B00jPokoZsOvFG5cMDTkC
 YstbPSagAEFdlgLRqgtDCVa+h6KvKuy7qd6HD77Kmz/xjr98bEM+iPJk2u5E9sIWz74n
 TqBds+qjJ80IUi93bRcvNlajQ0hJGdnQAWKo5MW++sBYM2sHBglvrae+sqgx5Qvn7fQB
 BtI7A4T4UH2TMBICnFMoU+G23ozsCgdiDz8xL2MCbQT4TgsspEB4hlbb1eCGbPulmKaF
 8qQdkaPU5G0oMlydFyFeinET41x1xjTTQUycmmBK5udvhhUzVG9Er7uiUAzNi6w+ExeU
 cdKw==
X-Gm-Message-State: APjAAAWMXb/hBP8LTMwmDs6LIQnHIhwh5oi4zD1FFlhb2v4bz5mm+WIO
 vyHw5f9WHELfwQW/9+xwgGXokQ==
X-Google-Smtp-Source: APXvYqzoR8001nycqA47aAwHYB8TFNG6jxgEY1mY9b15Zx7v+/BxfcA4dwe4+0Gp70CAao/rEQLNXQ==
X-Received: by 2002:a2e:9b14:: with SMTP id u20mr14356452lji.67.1556557667904; 
 Mon, 29 Apr 2019 10:07:47 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id z17sm6926179lja.26.2019.04.29.10.07.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 10:07:46 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:32:29 -0700
From: Olof Johansson <olof@lixom.net>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: add aspeed folder and misc drivers
Message-ID: <20190429163229.ibeny5r4islxiyrp@localhost>
References: <20190422173838.182736-1-venture@google.com>
 <CAK8P3a0k_8+R9FeyZsL6Egvi1Z-G0VrvR0TWXzGHryqxTr6thg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0k_8+R9FeyZsL6Egvi1Z-G0VrvR0TWXzGHryqxTr6thg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linux-aspeed@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 arm-soc <arm@kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2019 at 10:08:11AM +0200, Arnd Bergmann wrote:
> On Mon, Apr 22, 2019 at 7:38 PM Patrick Venture <venture@google.com> wrote:
> >
> > Create a SoC folder for the ASPEED parts and place the misc drivers
> > currently present into this folder.  These drivers are not generic part
> > drivers, but rather only apply to the ASPEED SoCs.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> 
> Looks ok, but please resend to arm@kernel.org or soc@kernel.org
> so we can track the submission and make sure it gets applied if
> you want this to go through the arm-soc tree.
> 
> If Greg wants to pick it up, that's fine too.
> 
> Either way,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Applied to the SoC tree now.


-Olof
