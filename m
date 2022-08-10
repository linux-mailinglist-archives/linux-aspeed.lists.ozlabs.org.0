Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B421658E470
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 03:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2XFY3HT9z308B
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 11:21:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fC0U2DXU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fC0U2DXU;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2XFP374Sz2xmm
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 11:20:55 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so633561pjm.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Aug 2022 18:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oGCv7UOSFGXLD0hQznWAtmA26tIFvqeIa9EinYUWVqA=;
        b=fC0U2DXU6q9z36mNMnyJd8n0tF2sj/fY4ZoMcLQUglJ5Mv8CeapvBbb7hzgSHJ7wZ6
         q1pWb3XaRBWx01MTbTw0YK//UMKS1o/PT4aN2QD6eJ2DfnBlH57zmqU0XWGWEKvutvtP
         Cxo77XVPWBLi+eUFsxt1b3Y02DBIBXJB/38TjW3EyLYgJrFTycwI8Zja8DE/7N5+OSyM
         RkqR2Dvco01PIFu1bTvvkMbsxVOGt0eHciLupObXtOqJ1GMVQaBI80VxcHvI1Su1arE6
         n7UXUsG9cRwaLeOcFX90v2jZCDmUmVEPIrj+ZmFYMTvZl48Z6obELvUcxTIghUvn3Tbo
         r7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oGCv7UOSFGXLD0hQznWAtmA26tIFvqeIa9EinYUWVqA=;
        b=HsjrM1YvmE3DG0kZHvbOE0XBkONtTWj2nNNR14xMRa3o0+3qG89CDSc/jOfnOSnDmS
         oryGnKsTYeomclGSmue0RzC4xNQrwAkzq+cJk1EsmA4CrTqkh8IHJ2kYxXuM9hdFU31V
         igUSHih0pFMtP0tCtat/8gaaAjmUO1sjm0P6+BpQ5aoPQM4yhixrEwFq8wfTAjpQVYZy
         hfACw0hr13vxbhGN/a4ei71awjJ+zyzarUAjN0FatT4mMJyNIikfoB/Csvp7rXvMBdsU
         blqA9Oj9xStJ0ZPRpitzNCRUHGSxrdHZRDZHmck5nfHMDpz/8BCK7iUsboVooFqj20DW
         wkww==
X-Gm-Message-State: ACgBeo1jGy7g4HHMiUUBtawZDC3iSSpyGYroD35S2ix0mXYUwrJ3D3sT
	O0Q0X0RUeDiCgFCjVYYJa2s=
X-Google-Smtp-Source: AA6agR6ABR8JaIlus86kMkZiJWMLOXekVsGlDr2DXxQHm6TZBGj3W7vZVDhoDRAZOK9tv4j/eoAv5g==
X-Received: by 2002:a17:902:ce8e:b0:16f:8f2b:b16f with SMTP id f14-20020a170902ce8e00b0016f8f2bb16fmr22570853plg.167.1660094451054;
        Tue, 09 Aug 2022 18:20:51 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id s18-20020a170903215200b0016c3affe60esm11356754ple.46.2022.08.09.18.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 18:20:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] Update Facebook Bletchley BMC devicetree
Date: Wed, 10 Aug 2022 00:43:36 +0000
Message-Id: <20220810004338.329832-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series add modifications as below
1. add a IPMB node for USB debug card communication.
2. remove hdc1080 node due to incompatible 2nd source (si7021). 

Potin Lai (2):
  ARM: dts: aspeed: bletchley: add USB debug card IPMB node
  ARM: dts: aspeed: bletchley: remove hdc1080 node

 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.31.1

