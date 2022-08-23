Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDED59E578
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Aug 2022 16:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBsmQ0RTPz3btQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Aug 2022 00:58:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBslb3Srxz2xr6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Aug 2022 00:57:30 +1000 (AEST)
Received: by mail-oi1-f169.google.com with SMTP id r10so10512275oie.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Aug 2022 07:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=FAI+J/BAzIOCuYieqj21rHdsHuRaSuJ4Vj8kHpJSNAE=;
        b=fE7uN4p+JtYAahi5Xndos8teoA9Mvjdiw9hmwSRj2FLwQcL0lVzXGURYgOYtO/9CXY
         9iXrEdBalEpltvih2doupY0gldmKN4g/oftJFr37aMNjnsjd5+44cr09fJrzQmY1fTAk
         qeZYvTPOhPzZrhNgy+hjgyb/Xe3ngWH+oEfp79zVzlqL1HUzvZ8DvM5XxhEpgnZoO4kC
         8/yNFgcqgKVjLo71fP8wR2N2ihpsCL5objXJGSTecqtaFJq5zUZNSgLpDooxVaHNv9TH
         qhiMz/F+fBOPZSKUx6KU/kCpOiB1R6zzU7Zooyp5POOMaPqed8NuJ5bHXCoU4Dx9gkST
         Q6Ow==
X-Gm-Message-State: ACgBeo2ETDSv5dXnms9iLGWXq2ojgsD7MCAQvcA8iy91j525ecgsJf5q
	RLUojdMENBDr6/cgp/ywUw==
X-Google-Smtp-Source: AA6agR4hSJQAGxX3KN7ayKSxhwLdWv6s8/qh4bhvrE5yHsP9wzSBH+Rc0HRRZkXNGG1/4mMLZExhJw==
X-Received: by 2002:aca:3056:0:b0:345:64e9:7435 with SMTP id w83-20020aca3056000000b0034564e97435mr1417894oiw.19.1661266648690;
        Tue, 23 Aug 2022 07:57:28 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:57:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Xin Ji <xji@analogixsemi.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH] dt-bindings: usb: Add missing (unevaluated|additional)Properties on child nodes
Date: Tue, 23 Aug 2022 09:56:40 -0500
Message-Id: <20220823145649.3118479-9-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/analogix,anx7411.yaml    |  2 ++
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml     |  2 ++
 .../devicetree/bindings/usb/st,stusb160x.yaml        | 12 +++++++++---
 .../devicetree/bindings/usb/willsemi,wusb3801.yaml   |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
index ee436308e5dc..0e72c08e6566 100644
--- a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
+++ b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
@@ -23,6 +23,8 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml
+    unevaluatedProperties: false
+
     description:
       Properties for usb c connector.
 
diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 8b019ac05bbe..a86bcd95100e 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -67,6 +67,7 @@ properties:
 
   vhub-strings:
     type: object
+    additionalProperties: false
 
     properties:
       '#address-cells':
@@ -78,6 +79,7 @@ properties:
     patternProperties:
       '^string@[0-9a-f]+$':
         type: object
+        additionalProperties: false
         description: string descriptors of the specific language
 
         properties:
diff --git a/Documentation/devicetree/bindings/usb/st,stusb160x.yaml b/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
index b5a8c9814dd3..b8974807b666 100644
--- a/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
+++ b/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
@@ -33,6 +33,7 @@ properties:
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
 
     properties:
       compatible:
@@ -74,9 +75,14 @@ examples:
                 data-role = "dual";
                 typec-power-opmode = "default";
 
-                port {
-                    typec_con_ep: endpoint {
-                        remote-endpoint = <&usbotg_hs_ep>;
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                        reg = <0>;
+                        typec_con_ep: endpoint {
+                            remote-endpoint = <&usbotg_hs_ep>;
+                        };
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/usb/willsemi,wusb3801.yaml b/Documentation/devicetree/bindings/usb/willsemi,wusb3801.yaml
index c2b2243c7892..5aa4ffd67119 100644
--- a/Documentation/devicetree/bindings/usb/willsemi,wusb3801.yaml
+++ b/Documentation/devicetree/bindings/usb/willsemi,wusb3801.yaml
@@ -28,6 +28,7 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
+    unevaluatedProperties: false
     description:
       The managed USB Type-C connector. Since WUSB3801 does not support
       Power Delivery, the node should have the "pd-disable" property.
-- 
2.34.1

