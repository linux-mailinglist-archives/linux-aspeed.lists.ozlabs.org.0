Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B89986D4E
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 09:14:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDlFq2l3Gz2ywC
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 17:14:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727334844;
	cv=none; b=KOnPt8njFyXLC+gpafgIvMbm07zcHeQl0XacZ5NIJM3/qqJo7vV5mXuUEC9gblZ3ZCVAL4JtEzFpOyUHpYQzqKOnOrXkMR89DRqRK1OEgeF9OvSwGZSox36NRy7pImA3HMBGIoFH8xUaxDgog9KRh1EILRP0z6zmJKjyx8YKrPTlHfvsz78W80hOXd2pyH+8q50nNTvvlFSvbaJrIQ6cJ8HDRT4GM7KfW7SSR1tkR2IrFQz3tVR1sWYHeJAFttZOrayVL8DWUMhHgm3eVeHWsq2xtvdC8/7pnyAGKmOZDNV9Lvp5+ryVf4IASZoLcs+cl/JxJs98XDGisDL78VZVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727334844; c=relaxed/relaxed;
	bh=7xg53lKxd/fV5L3yyv64N/7D3XeLu8B2zPZOc1OOJLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DF5t9tV9Q8TNdl6Pi5fOxWVZdW7SRcbaVSBQy2fBF7QIljZN8XwHxxNuLmqGSINl4Vi1SHwSoRxNswDdgW9yvxB1rHBs0cTeicAg0RTAjoeHJTyfyNFUcrJjL7aGvzHD9gXluwSKoKl4geV99PC7Ie27ReXdNEGGF7n1h7CRxk2hGINh5upnlUo75vxISJ8GzJ55yRtvyik5+Mr+zL6DWlXK/te2pwHqrn1scUD30p3Lo5DsNbHg8w6X3VnNathAIwzrKEruDhCwPrI5D569jxqVly6SsQ4yG7eb9EfsoaQtpufFVDEEN53gJ9E2GioI5jq2KokqIeVvErkesf122A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSAwgPgE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSAwgPgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDlFm31L4z2yXY
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 17:14:04 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2057835395aso6669515ad.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727334841; x=1727939641; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xg53lKxd/fV5L3yyv64N/7D3XeLu8B2zPZOc1OOJLg=;
        b=gSAwgPgEBNOdlsqBF4ULG+WiqnAvT4LH7I6fE49aMFM8G5mgPmI7X/kTTQKMfIrpGu
         3hj7h2jHrWXhTcx7v8WR76B9zVnLoE9Cx+JHnLb0Sujhvhr5WMUWMD7sWefVwUh8/IPf
         XP3IOsZosbAvwdjS15K+YjGNHC3o06XDje+1g3js1BuGw5DEO16o1mZ2E3zF8GuErv0f
         Wh7Gzq/j4Z+4AIv7sMzBUNXvIhnOyVL3k9tXnRCtrNtwUCfH3m4TZkVjQT0oNETWhwUG
         k+lshEqqsuSU5yJniUpWQlF9AzH6QNMD0MlFxdn4C/LdNZKDTwTKOoBTrHrKwEhkMofH
         bKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727334841; x=1727939641;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xg53lKxd/fV5L3yyv64N/7D3XeLu8B2zPZOc1OOJLg=;
        b=ZEntyF1zRVP+iJRBQz67UkRrat5GhTWPMx8+0c3qNdTmG0FDGnTN9O2dXiY/IylUQP
         1bDw7Pvf2oSA/s+f5Htg5c0ARwJblyQ3rDWWLHMcZzKdV/2VMadJeiWSW6M/cNuRJgES
         /Y0Gsw38gBbyBxKLdrokOzJKghqBdgVXz9oLiMpL9Oxl1KTrE5N10QFzLP4zaNL83ZIZ
         gEb4Yl7i0fIeOjgc2V7elK6A/NtSw+Rs/vkr3dX7niz8Yk6K0Sx2ua5/eI3J2ZCzkKcL
         UW/8KcNPjrimfplpzWnH8ZdF9Awp2WGeioS9LMb333K6rkKVYyc1mD8RW7xB6PlMd1qX
         2iAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXXAwFepRHGHfnGhIhWaBbyJG+5I08eCk0HeIoPnlbTTP+n8g+sCTdolroadr/6CC5UnM8GWZlNt7VCAQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBe3OOSJz/LRJtvYsLZm7EIzL4cQg2592eQmWko7m1w3slKGaZ
	hhOg2S7iOWDF1vs2UCCbgYEX4Q+Z0Otfv1msSzDpBoDh4xI9Usl3
X-Google-Smtp-Source: AGHT+IGgetcHFe4KXGimiw8jXeDLO0mzni6P5pkGHGyLJbzUafG8Ci4pkGmfhsrJnqZkafkPJDFyVA==
X-Received: by 2002:a17:902:fa4d:b0:207:1616:60db with SMTP id d9443c01a7336-20afc3f8e43mr62700175ad.6.1727334841360;
        Thu, 26 Sep 2024 00:14:01 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d3e79sm2662906a91.27.2024.09.26.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:14:01 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/3] ARM: dts: aspeed: catalina: dts update for EVT and
 DVT schematic
Date: Thu, 26 Sep 2024 15:10:43 +0800
Message-Id: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMI9WYC/42NOw6DMBAFr4K2zkbGMb9UuUdEYWCBlTBGtmUFI
 e4ehxOkeMW8YuYAT47JwzM7wFFkz3ZNIG8Z9LNeJ0IeEoMUUolGltjroBdeNVIMOKT53QcyaOz
 A446PuuyoKHIaiwaSZHM08ucKvNvEM/tg3X71Yv57/1bHHAXWSsuqU5VQontNRvNy762B9jzPL
 wL31cXMAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727334839; l=817;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=pKM9NTdihtjUsepqgg5XW6WK0UV4+xrQ48OpEpnh7o4=;
 b=cBAWdbLSL9JNkjZULyYUfi3lgf0/a+kS/msvkL3oK/yp7M+8lQpkmJKViibHLOq+j+gj7QEQl
 vNhpqlCblhcBv+hqioDDYYVsXbHQODwp2h1aszQ7VeGdpP4OsXH1ngx
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update Catalina devicetree based on EVT and DVT schematic changes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v2:
- add new commit for change NIC1 EEPROM address
- Link to v1: https://lore.kernel.org/r/20240926-catalina-evt-dvt-system-modify-v1-0-84a27b47040b@gmail.com

---
Potin Lai (3):
      ARM: dts: aspeed: catalina: move hdd board i2c mux bus to i2c5
      ARM: dts: aspeed: catalina: enable mac2
      ARM: dts: aspeed: catalina: update NIC1 fru address

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 176 +++++++++++----------
 1 file changed, 92 insertions(+), 84 deletions(-)
---
base-commit: e56a4f51601d8d874237557a359a3db0dc50b0a9
change-id: 20240926-catalina-evt-dvt-system-modify-386be551ef59

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

