Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F275792083
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 08:24:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HQgFyF53;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfwTQ2rC4z30h5
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 16:24:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HQgFyF53;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfwTJ1xVYz2yDS
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Sep 2023 16:24:34 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68a520dba33so1691055b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Sep 2023 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693895071; x=1694499871; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZe9XtPeDijJTfBrAmZ3rs+0VNHgiBDEk7wGRdjI3c4=;
        b=HQgFyF53dR9O+Ep/piJEA+iBPr1V2z/ok+CRVuA/9GSBkXSqSEYgqd5pCER24C6P0i
         Su+olVQpfOcqRUb7BJYHGqmOEi3mcUazFVc+srw/quz7jnjs8oDSha4rlN+xMCtmGddh
         zQmrpSd0RLaxJWUdyDio2HHdDDNOfW+zSVYTcNG+GKAF4f4r53MPz99Np88kTrz0WCsU
         eCsPpveIuFxhgQubMOTwLF9/KSLL8qoHMZU7NFZevEXSGt48B0T4nzVprIjPIWH4HqXA
         tKWnQsnwJlUpOJFwJq4xVpCrSqmqutVcwrxmC8Qb+kW+heQrKTtpclG7w+JJGIIE8Acs
         CU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693895071; x=1694499871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZe9XtPeDijJTfBrAmZ3rs+0VNHgiBDEk7wGRdjI3c4=;
        b=FCRV5GDBph6MCCcuTWXlEEYDLU3ORANf61xDGYaTyYthpU3eVZoGo7TPaNR1KXNHc7
         ZubnmFsNYSCeffUCR8J63Ktu0gARAUv0aZh1QJx4DtVfuQzjZzbKFLmnyy0vxdsHY1+C
         qIOq8hmXGYficd2tRuKkNUK1mC+iD5niF8MQ101Fm8CA2/g4olB4ddz67i80yaTZ3en2
         gDpiRxDF5t2R/2+mzUoaurMarEVQky1ruH5e1pG1HtPXk18OHCwFQ+nq2Q/fP89d8Ntn
         DM15iNUNJXwQ4KA0ZvWV92G7wQ8JYx1YLJWuKn2GIQbNW/A6hdvprBUxyYacl/RAPHQc
         /7NQ==
X-Gm-Message-State: AOJu0YyHir/ajY/R/TeUiBacTtvLxPxNVK80VTxdnD6+SIGIqxREdtLf
	tCqWOy0IurkVuu2IQz3hraE=
X-Google-Smtp-Source: AGHT+IF+MDQa2Y721EGnUs4M/DkAWziEdIlV8HdGxLhcRV71seoYweMUgY5Oosud0dFN4iHAX6FM+A==
X-Received: by 2002:a05:6a20:7491:b0:12e:73bb:cbb6 with SMTP id p17-20020a056a20749100b0012e73bbcbb6mr15530522pzd.14.1693895071456;
        Mon, 04 Sep 2023 23:24:31 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e18-20020a17090301d200b001bd41b70b60sm8526721plh.45.2023.09.04.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 23:24:31 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] Add Facebook Minerva (AST2600) BMC
Date: Tue,  5 Sep 2023 14:22:20 +0800
Message-Id: <20230905062223.774871-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Correcting the arrangement order in Makefile.
  +	aspeed-bmc-facebook-greatlakes.dtb \
  +	aspeed-bmc-facebook-minerva.dtb \
  +	aspeed-bmc-facebook-minipack.dtb \

Correcting the arrangement order in Document
  +            - facebook,greatlakes-bmc
  +            - facebook,minerva-bmc
  +            - facebook,yosemite4-bmc

Remove redundant blank line.
1.
  +	/*P4-P7 line 248-255*/
  +	"","","","","","","","";
  +};

2.
  +
  +// SOL Host Console

3.
  +
  +//BIOS Flash

4.
  +&uart2 {
  +	status = "okay";
  +	pinctrl-0 = <>;
  +};

Use stdout-path.
  +	chosen {
  +		stdout-path = &uart5;
  +	};

Fix dts path.
  old:arch/arm/boot/dts/
  new:arch/arm/boot/dts/aspeed


*** BLURB HERE ***

Peter Yin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 377 ++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

