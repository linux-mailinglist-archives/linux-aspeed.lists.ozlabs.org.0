Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABE04F43E
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Jun 2019 09:59:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45W7J36KKLzDqcN
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Jun 2019 17:59:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="gnUuPyJv"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45W7Hx20zjzDqVv
 for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2019 17:59:41 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id n11so9392138qtl.5
 for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2019 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ElCthtyVkpp3D7OzaN9Wr+2IruvrGmFjxxEU3huFxdM=;
 b=gnUuPyJvg5zipZFWSvr2EWlhyoeYVQ8S/qBgGbjrC9L8THV4O7CfMaZ9WlWb8NOQmU
 oThroHu+z04OkjXtRzTXFfyCY4fC4Hfi5fydYFovnnUzyfWmqcUMFTfho7KyNHrNdU6Y
 Yrb8Ja1J0pGUbcXtmUKz9nB5csl6nv9hDecoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ElCthtyVkpp3D7OzaN9Wr+2IruvrGmFjxxEU3huFxdM=;
 b=nXEkrOTwpE3KIduvs/155GtjPBoDyD/J/v/t/Lw+ST6ZRPVPJ63xyVPip0Q5ORP10q
 FwjEfVabWmp6Y3lzsMxMdjwb200XUy7i/43h+SFkEpW8ZHAOhfHdAAf7kMY9R9phSOky
 AqlUIrAOjar8+AIsOCn+ElMnlw5uFBiJv+IaEIB/E06bocAJSZawDQA3gOj/+fHMlqw+
 FRvAwLZ4J/ZwTQZUbN7WTG7L0EfZSGlV+/utZiq2L0rIL7hyKIKnXD2qbFZONFR7LoT0
 iDaWDYjzT7FCINmCugmW7gMr40zqdIczq2JREbPV3CLvVjgY83ixg/ZVox08Pz+3pAHS
 GKGw==
X-Gm-Message-State: APjAAAWWhqMaBnvl7x+CXj0DAeXtEU0LYYpcp1cQsyjrFCKJpojHZrV4
 aGW17vQX/QzI/+a+Cb3m8YBoQc9L0jGNzu4bnAg=
X-Google-Smtp-Source: APXvYqx/IwkmIiHtRDF2BSfmgwSk1awBdS8Qs9gCV6RU/5T4Ce3sfCirZpzBCSUzB+W61jJcGQdkM1SqKErfGs8fKzM=
X-Received: by 2002:ac8:264a:: with SMTP id v10mr88767490qtv.255.1561190378628; 
 Sat, 22 Jun 2019 00:59:38 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 22 Jun 2019 07:59:26 +0000
Message-ID: <CACPK8Xdpd3Q7dexOEZqt9rP0KJz1XeRwXe6A1k1azm7eDhRm=g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.3
To: arm <arm@kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi ARM maintainers,

Here is a small soc change and a fix for that same change. This is the
first time I've had an aspeed soc pull request, so here we go.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
    tags/aspeed-5.3-soc

for you to fetch changes up to c8a3b9b50d8331528fc8d03aadd1fec3d60362d7:

  soc: aspeed: lpc-ctrl: Fix probe error handling (2019-06-22 16:56:35 +0930)

----------------------------------------------------------------
ASPEED SoC updates for 5.3

LPC control driver changes and a fix.

----------------------------------------------------------------
Joel Stanley (1):
      soc: aspeed: lpc-ctrl: Fix probe error handling

Vijay Khemka (1):
      soc: aspeed: lpc-ctrl: make parameter optional

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 61 ++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 23 deletions(-)
